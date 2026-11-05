---
name: context-map
description: Build or refresh the short project map in CLAUDE.md and nested CLAUDE.md files so the agent gets a map, not a manual. Use when onboarding a repo, when CLAUDE.md is long or stale, or when Claude keeps missing where things live.
disable-model-invocation: true
---

# Context map

Goal: maximum signal per token. The root `CLAUDE.md` is loaded every session; nested `CLAUDE.md` files load only when Claude works in that folder; skills load only when used.

1. Read the current root `CLAUDE.md` and list the top-level directories.
2. Rewrite the root map so it covers only: what the project is, where things live (one line per area), the key commands, working rules, and what must not change. Aim for under 100 lines.
3. For each large area (an app, a service, a package), create or update `<area>/CLAUDE.md` with that area's purpose, entry points, local commands and gotchas.
4. Move any multi-step procedure out of `CLAUDE.md` into a skill under `.claude/skills/<name>/SKILL.md`.
5. Move file-type rules into `.claude/rules/<topic>.md` with a `paths:` list in frontmatter.
6. Delete lines that are stale, duplicated, or derivable from the code. Report what you moved and removed.
