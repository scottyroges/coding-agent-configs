Review code changes in two stages: spec compliance, then code quality.

Usage:
  /pr-review                          — if on a feature branch, review the full branch diff against main. Otherwise, review staged changes.
  /pr-review last                     — review the last commit
  /pr-review HEAD~3                   — review the last 3 commits
  /pr-review main...feature-branch    — review a branch diff
  /pr-review abc123..def456           — review a commit range

Options:
  /pr-review --spec "description"     — provide what the changes should accomplish
  /pr-review --spec .personal/docs/plans/active/auth-refactor.md — reference a plan file as the spec

Dispatch this to the code-reviewer agent. Pass the scope and spec if provided. If no spec is given, the agent will infer intent from the code and commit messages.

If the review passes, ask the user if they want to run `/finish` to wrap up and commit.
