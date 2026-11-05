# Agent harness spec

Fill this in before giving an agent meaningful autonomy. If a field is undefined, the agent is improvising.
Field list from Lunar's "Harness Engineering" X Article, section 17. Right-hand notes map each part to this kit.

```text
1. CONTRACT       objective, scope, constraints, acceptance evidence      -> state/TASK.md, /task-contract
2. CONTEXT        always-loaded map, retrieval sources, local
                  instructions, freshness rules                           -> CLAUDE.md, nested CLAUDE.md, .claude/rules, skills
3. TOOLS          allowed tools, preconditions, side effects, success
                  evidence, timeout and retry policy                      -> permissions, MCP config, PreToolUse hooks
4. STATE          facts, decisions, progress, lessons, checkpoint format  -> state/STATE.md, /session-state
5. POLICY         automatic, approval-required, prohibited actions,
                  budget limits                                           -> permissions allow/ask/deny, guard hooks
6. VERIFICATION   deterministic checks, adversarial checks, acceptance
                  rule                                                    -> PostToolUse checks, /verify-before-done, verifier agent
7. RECOVERY       failure classes, retry limits, escalation conditions,
                  safe rollback                                           -> TASK.md budget, /failure-to-harness, git
8. OBSERVABILITY  trace events, metrics, final change receipt             -> hooks logs, state/RECEIPT.md, /change-receipt
```
