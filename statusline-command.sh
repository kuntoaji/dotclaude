#!/bin/sh
input=$(cat)

user=$(whoami)
host=$(hostname -s)
dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
repo=$(echo "$input" | jq -r '.workspace.repo | if . then .owner + "/" + .name else empty end')
branch=$(echo "$input" | jq -r '.worktree.branch // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
ctx=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Build prompt line
line=$(printf '\033[32m%s\033[0m@\033[32m%s\033[0m \033[34m%s\033[0m' "$user" "$host" "$dir")

if [ -n "$repo" ]; then
  line="$line $(printf '\033[33m(%s)\033[0m' "$repo")"
fi

if [ -n "$branch" ]; then
  line="$line $(printf '\033[36m[%s]\033[0m' "$branch")"
fi

if [ -n "$model" ]; then
  line="$line $(printf '\033[35m%s\033[0m' "$model")"
fi

if [ -n "$ctx" ]; then
  line="$line $(printf '\033[90mctx:%s%%\033[0m' "$(printf '%.0f' "$ctx")")"
fi

printf '%b\n' "$line"
