#!/bin/bash
# PostToolUse on Edit|Write: run the cheapest deterministic check for the edited file.
# Exit 2 shows stderr to Claude (the edit already happened). Replace CHECK with your own command.
file=$(jq -r '.tool_input.file_path // ""')
[ -z "$file" ] && exit 0
case "$file" in
  *.ts|*.tsx|*.js|*.jsx) CHECK="npx --no-install eslint --quiet \"$file\"" ;;
  *.py) CHECK="python3 -m py_compile \"$file\"" ;;
  *.json) CHECK="jq empty \"$file\"" ;;
  *) exit 0 ;;
esac
out=$(eval "$CHECK" 2>&1) || { echo "Fast check failed for $file:" >&2; echo "$out" | head -n 40 >&2; exit 2; }
exit 0
