---
name: change-receipt
description: Write a short change receipt in state/RECEIPT.md at the end of a run, listing what changed, what was verified, what was not, decisions, risks and approvals needed. Use when finishing a task or handing off to a person or the next session.
disable-model-invocation: true
---

# Change receipt

The receipt is a summary of what the system can prove, not of what the model said.
Overwrite `state/RECEIPT.md` with this shape and nothing else:

```text
OBJECTIVE
<one line from state/TASK.md>

CHANGED
- <file or behaviour>

VERIFIED
- <check>: <result>

NOT VERIFIED
- <what could not be checked and why>

DECISIONS
- <choice>: <reason>

RISKS
- <risk>

APPROVAL NEEDED
- <action>
```

Keep it under 40 lines. Then update `state/STATE.md` so the next session starts from state, evidence and open risk, not from the transcript.
