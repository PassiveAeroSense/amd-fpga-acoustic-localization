---
name: fpga-evidence-check
description: Verify Vivado resource and timing reports against a delivered FPGA configuration and identify evidence gaps when preparing engineering results or reproducing an implementation.
---

# FPGA evidence check

Use for an RTL or HLS project with Vivado text reports. Read `references/workflow.md` for the tested workflow and failure boundaries.

1. Identify the source revision, target part, top module, tool version, configuration and bitstream hash before comparing results. Preserve original reports.
2. Run `scripts/check_reports.py` with the routed utilization and timing reports. Parsing failure is a failed check, never a zero-resource result.
3. Read CDC, DRC and timing exceptions separately. Nonnegative slack supports only the constraints actually applied. Match asynchronous controls and source-synchronous data to the RTL and XDC.
4. Compare baselines with explicit workload, domain and functional differences. Audio window duration, kernel execution time and end-to-end latency have distinct meanings.
5. Rebuild from a separate working directory, run boundary cases and record hashes. Keep physical observations and simulation outputs separately identified.

The scripts accept external report paths; no board, microphone layout or project name is embedded in the parser. Use the reusable prompt in the reference file when applying the workflow with an assistant.
