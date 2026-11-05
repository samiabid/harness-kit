#!/bin/bash
# SessionStart: inject durable state so a new or resumed session starts from state, not the transcript.
# Plain-text stdout on SessionStart is added to Claude's context.
STATE="${CLAUDE_PROJECT_DIR:-.}/state/STATE.md"
TASK="${CLAUDE_PROJECT_DIR:-.}/state/TASK.md"
[ -f "$TASK" ] && { echo "Current task contract (state/TASK.md):"; head -n 60 "$TASK"; echo; }
[ -f "$STATE" ] && { echo "Current run state (state/STATE.md):"; head -n 80 "$STATE"; }
exit 0
