---
name: task-contract
description: Turn a vague request into a written task contract in state/TASK.md before doing non-trivial work. Use at the start of any multi-step task, feature, bug fix or refactor, or when the goal, scope or done criteria are unclear.
argument-hint: "[request]"
---

# Task contract

Write `state/TASK.md` from the request below before acting. Use `state/TASK.template.md` as the shape.

Request: $ARGUMENTS

Answer all five, briefly and concretely:
1. Outcome: what must exist or be true when this is done.
2. Scope: files, modules or systems you may change.
3. Must not change: behaviour, APIs, files or data that stay as they are.
4. Evidence: the checks that prove completion (commands, tests, observable results). Prefer deterministic checks.
5. Approvals: actions that need a human first (deploys, external messages, deletes, migrations, spend).

If an answer can't be found in the repo or the request, list it under Open questions and ask before starting. Then work toward the contracted outcome, not toward plausible activity.
