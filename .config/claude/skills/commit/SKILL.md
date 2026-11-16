---
name: commit
description: Create well-formatted git commits following conventional commit standards. Use when the user asks to commit staged changes or invokes /commit.
---

# Git Commit Skill

Create well-formatted git commits following conventional commit standards.

## Usage

```text
/commit
```

## Behavior

1. Analyze staged changes with `git diff --staged`
2. Generate a conventional commit message
3. Create the commit with proper formatting

## Commit Format

```text
<type>(<scope>): <description>

[optional body]

[optional footer]
```

## Body Rule

- Default to a title-only commit. If the title alone fully describes the change, do NOT add a body.
- Add a body only when the full change cannot be described in the title (e.g. several distinct changes, or a non-obvious reason that must be recorded).
- Never add a body that just restates the title.
- If the title can't describe the change because it mixes unrelated changes, propose splitting it into several commits (each with its own title) instead of one commit with a long body. Ask the user before re-staging.

## Types

- feat: New feature
- fix: Bug fix
- docs: Documentation changes
- style: Code style changes
- refactor: Code refactoring
- test: Adding or modifying tests
- chore: Maintenance tasks

## Example Output

Title only (the change fits in the title):

```text
fix(api): handle null user in profile endpoint
```

With body (the change does not fit in the title):

```text
feat(auth): add password reset functionality

- Add forgot password form
- Implement email verification flow
- Add password reset endpoint
```
