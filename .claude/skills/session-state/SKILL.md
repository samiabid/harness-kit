---
name: session-state
description: Keep durable run state in state/STATE.md (facts, decisions, progress, lessons) so work survives compaction and new sessions. Use when starting or resuming work, after a key decision, after finishing a step, and before compaction or handoff.
---

# Session state

Conversation history is an event stream, not memory. Compile what matters into `state/STATE.md`.

Sections, kept short and current:
- Facts: stable things learned about the environment (where code lives, required env vars, odd commands).
- Decisions: each choice and the reason for it.
- Progress: completed, active, blocked, remaining.
- Lessons: failures that should change future behaviour.

Rules:
- Read `state/STATE.md` first when resuming. Trust it over memory of the conversation.
- Update it after each meaningful step, not only at the end.
- Edit entries in place; remove stale or contradicted facts instead of appending forever.
- Keep it under about 80 lines. Move long detail into a linked file.
