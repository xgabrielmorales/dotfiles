---
name: dot-commit
description: Create git commits in this project's `[scope] - description` format.
---

# Git Commit Skill

Create git commits using this project's `[scope] - description` format.

## Usage

```text
/dot-commit
```

## Behavior

1. Analyze staged changes with `git diff --staged`
2. Generate a title-only commit message in the project format
3. Create the commit with proper formatting

## Commit Format

This project does NOT use conventional commits. Use:

```text
[<scope>] - <lowercase imperative description>
```

- `<scope>` is the app/config dir touched (`zsh`, `ironbar`, `atuin`, `git`, `just`, `k9s`, `gtk`, ...), or `os` for anything under `.config/nixos/` (packages, inputs, hosts, modules).
- Description: lowercase, imperative, no trailing period.
- Check `git log --format=%s -40` if unsure which scope to use.

## Body Rule

- Title only. Do NOT add a body or footer.
- If the title can't describe the change because it mixes unrelated changes, propose splitting it into several commits (each with its own title) instead. Ask the user before re-staging.

## Example Output

```text
[os] - bump zapfast to 0.21.0
[ironbar] - add disk usage sys_info module
[zsh] - alias sudo to run0
```
