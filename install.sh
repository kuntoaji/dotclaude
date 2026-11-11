#!/bin/sh
# Symlink this repo's config into ~/.claude. Safe to re-run.
# Existing files that are not already our symlinks are moved to *.bak.<timestamp>.
# Skills are linked one by one, so other skills in ~/.claude/skills stay in place.
set -eu

repo=$(cd "$(dirname "$0")" && pwd -P)
dest="$HOME/.claude"
stamp=$(date +%Y%m%d%H%M%S)

link() {
  src=$1
  target=$2

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$src" ]; then
    echo "ok      $target"
    return
  fi

  if [ -L "$target" ]; then
    rm "$target"
  elif [ -e "$target" ]; then
    mv "$target" "$target.bak.$stamp"
    echo "backup  $target -> $target.bak.$stamp"
  fi

  ln -s "$src" "$target"
  echo "linked  $target -> $src"
}

mkdir -p "$dest/skills"

for item in CLAUDE.md rules settings.json statusline-command.sh; do
  link "$repo/$item" "$dest/$item"
done

for skill in "$repo"/skills/*/; do
  name=$(basename "$skill")
  link "$repo/skills/$name" "$dest/skills/$name"
done
