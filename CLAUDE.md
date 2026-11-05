# Project map

Keep this file under about 100 lines. It is loaded every session, so every line costs context.
Put procedures in `.claude/skills/`, folder detail in nested `CLAUDE.md` files, file-type rules in `.claude/rules/`.

## What this project is
<one or two lines: what it does and who uses it>

## Where things live
```text
product rules     -> docs/product/
architecture      -> docs/architecture.md
frontend          -> apps/web/            (has its own CLAUDE.md)
backend           -> services/api/        (has its own CLAUDE.md)
tests             -> tests/
commands          -> docs/commands.md
release rules     -> docs/release.md
```

## Commands
- Install: `<cmd>`
- Fast check (lint + types): `<cmd>`
- Focused tests: `<cmd> <path>`
- Full tests: `<cmd>`

## Working rules
- Start non-trivial work with `/task-contract`. Work toward `state/TASK.md`, not toward plausible activity.
- Keep `state/STATE.md` current (facts, decisions, progress, lessons). Read it first when resuming.
- Never claim done without evidence. Use `/verify-before-done`, then `/change-receipt`.
- Ask before anything with an external effect (deploy, send, publish, purchase). Permissions enforce this too.

## Must not change without approval
- <paths or behaviours that are off limits>
