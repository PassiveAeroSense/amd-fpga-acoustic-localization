---
name: fpga-stream-debug
description: Diagnose intermittent FPGA acquisition, cross-clock transport and stale-result faults using timestamped traces, explicit validity and fault-injection regressions; apply to ADC, sensor or streaming RTL pipelines.
---

# Streaming FPGA fault diagnosis

Use when a system sometimes reads the wrong channel, stalls, preserves an old valid result, or differs between module simulation and the board. This is a trace-guided workflow, not an automatic wiring or pin-remapping tool.

1. Identify the deployed bitstream and source snapshot. Read [historical cases](references/project_lessons.md) for the relevant symptom; the dated records explain how the workflow arose, not the current board state.
2. Separate acquisition, transport, computation and display. At each boundary record payload, frame/epoch, valid, ready, fault and result age. A visible number or a recent valid frame alone is not proof of a healthy stream.
3. For suspected channel shifts, capture the full transaction including the first read and the boundary to the next frame. Compare BUSY/FIRSTDATA with the actual RD/CS sequence and adjacent data, rather than changing array coordinates to fit a direction estimate.
4. For cross-clock faults, register source-domain status before synchronizing it; examine mailbox stability and acknowledgment with RTL/XDC and CDC reports. A false-path constraint expresses a timing exception, not a correctness proof.
5. Write the expected invalidation/holding policy before changing logic. Detection state, direction, position and UI can have different policies. Define how epochs, overflow, missing data and age affect each result.
6. Use the [fault matrix and reusable prompt](references/project_lessons.md) to select discriminating tests. Inject faults in the actual integration path and verify recovery as well as rejection. For display pipelines, capture full rasters with DE and timing aligned.
7. Compare the exact source/ROM/XDC snapshot with implementation artifacts, then record board observations separately. Keep temporary diagnostic IP separate from the submission build and account for its resource/timing effects.

The historical excerpts and source-file hashes are in `references/memory_cases.json`. Current example regressions in this submission are `sim/results/test_live_detection.log` and `sim/results/test_r24_control.log`; their scope is detection-state and position-tracker control behavior. Reuse the workflow with the new design's own interfaces and tests. Board-level analog or electrical causes require physical measurements.
