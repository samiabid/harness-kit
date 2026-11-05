#!/bin/bash
# Stop: don't let Claude finish while state/STATE.md lists remaining work and no receipt exists.
# Uses stop_hook_active to avoid looping. Delete this hook if it gets in the way (build to delete).
input=$(cat)
[ "$(jq -r '.stop_hook_active // false' <<<"$input")" = "true" ] && exit 0
DIR="${CLAUDE_PROJECT_DIR:-.}/state"
[ -f "$DIR/TASK.md" ] && [ -f "$DIR/STATE.md" ] || exit 0
[ -s "$DIR/RECEIPT.md" ] && exit 0
# Count "- item" lines under "remaining:" until the next "key:" line, ignoring <placeholders>.
left=$(awk '/^[[:space:]]*remaining:/{f=1;next} f&&/^[[:space:]]*[a-z_]+:/{f=0} f&&/^[[:space:]]*-[[:space:]]+[^<[:space:]]/{n++} END{print n+0}' "$DIR/STATE.md")
if [ "$left" -gt 0 ]; then
  jq -n --arg n "$left" '{decision:"block", reason:("state/STATE.md lists " + $n + " remaining item(s) and there is no state/RECEIPT.md. Finish the work, run /verify-before-done, then /change-receipt, or record in STATE.md why you are stopping.")}'
fi
exit 0
