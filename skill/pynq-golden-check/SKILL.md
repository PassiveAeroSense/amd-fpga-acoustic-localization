---
name: pynq-golden-check
description: Organize portable golden-reference verification for PYNQ overlays, compare numerical outputs, and separate transfer, kernel, and end-to-end timing when porting an accelerator across boards.
---

# PYNQ golden-reference verification

Use this for an existing PYNQ accelerator with saved reference arrays, or for preparing its host-side validation. The checker and contract validator run on desktop Python. The DMA helper targets a single-packet AXI simple DMA with both channels; it is not a driver for the current Artix-7 microphone board.

1. Read [the host workflow](references/pynq_workflow.md), then copy `assets/contract_example.json` and replace the example board, numeric convention, shapes and artifact hashes. Run `scripts/pynq_contract.py contract.json --check-artifacts`. Validate hardware length parameters with `check_metadata` after parsing the actual overlay.
2. Use `Overlay(bitfile, download=False)` for metadata inspection. Loading an overlay is a separate deliberate board operation. Determine kernel arguments and start behavior from its real `register_map`; the helper does not guess them.
3. Follow [the execution recipe](references/execution_recipe.md). Allocate contiguous buffers, arm receive before sending, and use the bounded polling helper. Keep buffers and the failure object alive after a transfer failure until the DMA is quiescent. Avoid blind retries that can turn an old output into a new result.
4. Save independent golden and actual arrays; call `scripts/compare_arrays.py` with explicit tolerances. For integers use exact comparison; decode fixed-point scaling explicitly before a floating tolerance check. Preserve data ordering and complex representation.
5. Use [the failure matrix](references/failure_matrix.md) for shape, overflow, TLAST, cache, metadata and timeout faults. Record transferred bytes, input/output hashes and timing boundaries. Distinguish host transfer-and-compute duration from isolated kernel latency.
6. Run `python sim/test_skills.py` and `python sim/test_skill_extensions.py` in this submission. For reuse elsewhere, copy the script directory and provide the new contract and reference data. Run repeated calls and fault cases on the target board before claiming hardware validation.

Origins and verified boundaries are recorded in [project-derived lessons](references/project_origin.md). Desktop tests exercise contract checks, byte counts, ordering, timeouts and error paths with driver doubles. Physical PYNQ execution has not been performed for this submission; a double passing is not board evidence.
