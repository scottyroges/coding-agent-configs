Generate a PR description or commit message from code changes.

Usage:
  /pr-description                              — if on a feature branch, describe the full branch diff against main. Otherwise, describe staged changes.
  /pr-description last                         — describe the last commit
  /pr-description main...feature-branch        — describe a branch diff
  /pr-description HEAD~5                       — describe the last 5 commits

Dispatch this to the pr-writer agent. It will assess scope and produce either a commit message (small changes) or full PR description (larger changes).
