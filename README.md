# dotclaude

My personal Claude Code configuration.

## Contents

- `CLAUDE.md` - user-level instructions loaded in every session
- `rules/` - user-level rules, loaded automatically from `~/.claude/rules/`
- `settings.json` - user-level settings (theme, status line)
- `statusline-command.sh` - status line showing user, host, directory, repo, branch, model, and remaining context (requires `jq`)

## Setup

```sh
git clone <this-repo> dotclaude
cd dotclaude
./install.sh
```

`install.sh` symlinks each item above into `~/.claude`. It moves any existing file to `<name>.bak.<timestamp>` first, and is safe to re-run.

The script links individual files, not the whole `~/.claude` directory. Claude Code keeps runtime state there (history, sessions, project memory, credentials), and that state must not end up in this repo.

## Notes

- Put machine-specific settings in `~/.claude/settings.local.json`. It is not tracked.
- Changes made with `/config` write to `~/.claude/settings.json`, which is this repo's file. Review `git diff` before committing.
