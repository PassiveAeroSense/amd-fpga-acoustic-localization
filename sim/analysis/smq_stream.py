"""Read the block format observed in Smacq DAQ Software 2.05 recordings.

Empirical format, not a vendor-guaranteed interface: big-endian uint32 channel
count and samples/channel, followed by channel-major big-endian float64 volts.
Keep the original .smq and .smqinf files. Sample rate/channel names must match
the DAQ configuration; this reader does not decode .smqinf metadata.
"""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import struct
import time

import numpy as np


class SmqReader:
    def __init__(self, path, channels=8):
        self.path = Path(path)
        self.file = self.path.open("rb", buffering=0)
        self.channels = channels
        self.sample_index = 0

    def close(self):
        self.file.close()

    def read_block(self):
        """Return (first_sample_index, samples_by_channels), or None until complete.

        Values are unmodified volts. Row alignment is a scan, NOT simultaneous
        sampling: USB-3121 channel scan offsets require separate calibration.
        """
        offset = self.file.tell()
        if os.fstat(self.file.fileno()).st_size < offset:
            raise ValueError("Recording was truncated; reopen the new recording")
        header = self.file.read(8)
        if len(header) < 8:
            self.file.seek(offset)
            return None
        channels, count = struct.unpack(">II", header)
        if channels != self.channels or not 0 < count <= 2_000_000:
            raise ValueError(f"Unexpected block header at {offset}: {channels}, {count}")
        payload = self.file.read(channels * count * 8)
        if len(payload) != channels * count * 8:
            self.file.seek(offset)
            return None
        values = np.frombuffer(payload, dtype=">f8").reshape(channels, count).T
        values = np.ascontiguousarray(values, dtype=np.float64)
        if not np.isfinite(values).all():
            raise ValueError(f"Non-finite voltage at block offset {offset}")
        first = self.sample_index
        self.sample_index += count
        return first, values


def save_latest(path, first, values, sample_rate, source):
    """Atomic replacement: consumers see either the old or new complete block."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    with temporary.open("wb") as stream:
        np.savez(stream, volts=values, sample_index=np.int64(first),
                 sample_rate_hz=np.float64(sample_rate),
                 channels=np.arange(values.shape[1]), source=str(source))
    os.replace(temporary, path)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("file", type=Path)
    parser.add_argument("--rate", type=float, required=True,
                        help="Actual configured samples/second/channel")
    parser.add_argument("--channels", type=int, default=8)
    parser.add_argument("--follow", action="store_true")
    parser.add_argument("--seconds", type=float, default=0,
                        help="Reader runtime limit; 0 means unlimited")
    parser.add_argument("--idle-timeout", type=float, default=5)
    parser.add_argument("--latest", type=Path,
                        help="Optional atomic .npz snapshot for other programs")
    args = parser.parse_args()
    if args.rate <= 0:
        parser.error("--rate must be positive")
    reader = SmqReader(args.file, args.channels)
    start = last_data = time.monotonic()
    blocks = 0
    try:
        while not args.seconds or time.monotonic() - start < args.seconds:
            block = reader.read_block()
            if block is None:
                if not args.follow:
                    if reader.file.tell() != os.fstat(reader.file.fileno()).st_size:
                        raise ValueError("Incomplete final block; use --follow for active recordings")
                    break
                if args.idle_timeout and time.monotonic() - last_data >= args.idle_timeout:
                    break
                time.sleep(0.05)
                continue
            first, values = block
            last_data = time.monotonic()
            blocks += 1
            if args.latest:
                save_latest(args.latest, first, values, args.rate, args.file.resolve())
            print(json.dumps({"block": blocks, "first_sample": first,
                              "samples": len(values), "channels": values.shape[1],
                              "data_end_seconds": reader.sample_index / args.rate,
                              "reader_elapsed_seconds": round(last_data-start, 3),
                              "mean_volts": values.mean(axis=0).round(8).tolist(),
                              "last_volts": values[-1].round(8).tolist()}), flush=True)
    finally:
        reader.close()


if __name__ == "__main__":
    main()
