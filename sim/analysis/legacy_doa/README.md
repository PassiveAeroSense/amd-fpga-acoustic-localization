# Legacy DOA implementation

Use `../reproduce_legacy_doa.py` from the submission root; see [reproduction instructions](../README.md). The entrypoint restores original filenames and historical working paths in a separate output directory, rebuilds calibration and gates from raw SMQ, and compares the three paper examples.

Do not run the historical batch scripts directly in the submission directory. `algorithm_trial_report.py` is an archival exploratory HTML report generator with original development paths, not a current delivery entrypoint. FPGA builds do not depend on this directory.
