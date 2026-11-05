---
name: failure-to-harness
description: After a failure or a correction, classify what went wrong and turn the lesson into a lasting harness change (rule, skill, check, hook or permission) instead of only fixing the output. Use when the agent repeats a mistake, a check fails twice, or the user corrects the same thing again.
disable-model-invocation: true
argument-hint: "[what went wrong]"
---

# Failure to harness

Fix the output, then fix the system that allowed it.

What went wrong: $ARGUMENTS

1. Classify the failure. Pick the first that fits:
   - task contract ambiguous
   - important context invisible
   - wrong tool exposed or tool misused
   - precondition missing
   - result unverifiable
   - policy left inside the prompt
   - recovery too broad (retried without changing anything)
   - trace insufficient to see what happened
2. Pick the lowest rung of the instruction ladder that reliably prevents it:
   explanation (CLAUDE.md line) -> checklist (skill step) -> template (state file) -> automated check (hook or test) -> enforced policy (permission deny or blocking hook).
   Rules that matter every time belong in hooks or permissions, not prose.
3. Make the change, keep it small, and add one line to `state/STATE.md` under Lessons naming the failure and the fix.
4. Note what you would remove later if the failure stops happening (build to delete).
