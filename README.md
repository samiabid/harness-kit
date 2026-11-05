# harness-kit

A lean starter kit for running Claude Code inside a harness instead of relying on a long prompt.

The idea, from Lunar's X Article "Harness Engineering" and the AI DevCon talk notes in Sami's vault: a prompt changes one attempt, a harness changes every attempt. The model reasons. The files, tools, checks and policy around it make the work reliable.

## What is in here

| Path | Role in the harness |
| --- | --- |
| `CLAUDE.md` | Always-loaded project map. Short. Points to where things live, not how everything works. |
| `.claude/rules/` | Path-scoped rules that load only when Claude touches matching files. |
| `.claude/skills/` | Procedures that load on demand (progressive disclosure). Each one is a `SKILL.md` with YAML frontmatter. |
| `.claude/agents/verifier.md` | A separate subagent whose job is to reject the work, with read-only tools and fresh context. |
| `.claude/settings.json` | Permissions (allow, ask, deny) and hooks. This is policy that does not depend on the model remembering it. |
| `.claude/hooks/` | Small deterministic scripts the hooks call. |
| `state/` | Durable run state: task contract, facts, decisions, progress, lessons, and the change receipt. |

## The loop

1. `/task-contract` turns a request into `state/TASK.md`: outcome, scope, must-not-change, evidence, approvals.
2. `/context-map` builds or refreshes the project map in `CLAUDE.md` and points to nested `CLAUDE.md` files.
3. Claude works. `/session-state` keeps `state/STATE.md` current so a new session can resume from it.
4. `/verify-before-done` runs the cheapest deterministic checks first, then hands the artifact to the `verifier` subagent.
5. `/change-receipt` writes `state/RECEIPT.md`: what changed, what was verified, what was not, risks, approvals needed.
6. When something fails, `/failure-to-harness` classifies it and moves the lesson down the instruction ladder: explanation, checklist, template, automated check, enforced policy.

## Hooks in the example settings

- `PreToolUse` on `Bash`: `guard-bash.sh` blocks destructive commands (exit code 2).
- `PostToolUse` on `Edit|Write`: `post-edit-check.sh` is a placeholder for a fast lint or type check. It reports problems to Claude via exit code 2.
- `SessionStart`: `session-start.sh` injects `state/STATE.md` so a resumed session starts from durable state, not the transcript.
- `Stop`: `stop-gate.sh` blocks "done" while `state/STATE.md` still lists remaining work and no receipt exists. Remove it if it gets in the way.

Hook scripts need `jq` and must be executable (`chmod +x .claude/hooks/*.sh`).

## Install into a project

```bash
cp -r harness-kit/.claude harness-kit/state your-project/
cp harness-kit/CLAUDE.md your-project/CLAUDE.md   # then edit the map
chmod +x your-project/.claude/hooks/*.sh
```

Then edit the project map, the `post-edit-check.sh` command, and the permission rules for your stack.

## Principles

- Give the agent a map, not a manual. Keep `CLAUDE.md` short; put procedures in skills and folder detail in nested `CLAUDE.md` files.
- The model proposes, the policy authorizes. Hard rules go in permissions and hooks, not prose.
- Completion needs evidence from the environment, not the model saying "done".
- Every repeated failure should leave infrastructure behind.
- Build to delete. Remove any piece that no longer earns its place.

## Sources

- Lunar (@LunarResearcher), "Harness Engineering: The Complete Guide to Building AI Agents That Don't Fall Apart", X Article, 6 Sep 2026.
- Talk at AI DevCon (by Tessl), "Learning while you Sleep: Beyond Memory to Dreaming", shown on screen as Lamis Mukta, Member of Technical Staff, Anthropic.
- Claude Code docs: skills, subagents, hooks, memory, permissions (code.claude.com/docs).

This kit is an independent interpretation, not an official Anthropic artifact.
