#!/bin/bash
# PreToolUse on Bash: block destructive or irreversible commands. Exit 2 blocks; stderr goes to Claude.
# Permissions already deny some of these; this catches variants the rules miss.
cmd=$(jq -r '.tool_input.command // ""')
if echo "$cmd" | grep -Eq 'rm -rf (/|~|\$HOME|\.)( |$)|git push (-f|--force)|git reset --hard|DROP (TABLE|DATABASE)|mkfs|:\(\)\{'; then
  echo "Blocked by harness policy: destructive command. Ask the user, or choose a reversible path." >&2
  exit 2
fi
exit 0
