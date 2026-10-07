#!/bin/sh
# Symlink this repo's config into ~/.claude. Safe to re-run.
# Existing files that are not already our symlinks are moved to *.bak.<timestamp>.
set -eu

repo=$(cd "$(dirname "$0")" && pwd -P)
dest="$HOME/.claude"
stamp=$(date +%Y%m%d%H%M%S)

mkdir -p "$dest"

for item in CLAUDE.md rules settings.json statusline-command.sh; do
  src="$repo/$item"
  target="$dest/$item"

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$src" ]; then
    echo "ok      $target"
    continue
  fi

  if [ -L "$target" ]; then
    rm "$target"
  elif [ -e "$target" ]; then
    mv "$target" "$target.bak.$stamp"
    echo "backup  $target -> $target.bak.$stamp"
  fi

  ln -s "$src" "$target"
  echo "linked  $target -> $src"
done
