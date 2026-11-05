---
name: verify-before-done
description: Prove a task is complete with evidence before claiming done. Runs cheap deterministic checks first, then sends the artifact to the verifier subagent to try to reject it. Use before saying a task is finished, before a commit, or before writing a change receipt.
---

# Verify before done

A model saying "done" is not evidence. Only the environment can prove completion.

1. Read `state/TASK.md` for the outcome, must-not-change list and evidence.
2. Run the checks in cost order and stop at the first failure:
   syntax and lint, then types, then focused tests, then integration tests, then visual or semantic review.
   Use code where code can answer (compiler, schema, test, query, checksum). Use a model only for real ambiguity.
3. Record each check and its result in `state/STATE.md` under Progress.
4. If everything passes, delegate to the `verifier` subagent with: the contract, the list of changed files, and the check results. Ask it to find a reason to reject.
5. If the verifier rejects, fix the cause, then repeat from step 2. Do not argue it out of the rejection.
6. Only then move on to `/change-receipt`. If something could not be verified, say so plainly.
