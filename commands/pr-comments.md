Address open PR review comments on the current branch.

Usage:
  /pr-comments              — fetch and address all unresolved comments
  /pr-comments --dry-run    — show comments without making changes

## Process

### 1. Find the PR

Run `git branch --show-current` to get the current branch name.

Then run `gh pr view --json number,title,state,url` to check if there's an open PR for this branch.

If there is no open PR, tell the user and stop.

### 2. Fetch Comments

Fetch all review comments and conversation comments:

```
gh pr view {number} --json comments,reviews,reviewRequests
```

If that doesn't include inline comments, fall back to:
```
gh api repos/{owner}/{repo}/pulls/{number}/comments --paginate
gh api repos/{owner}/{repo}/issues/{number}/comments --paginate
gh api repos/{owner}/{repo}/pulls/{number}/reviews --paginate
```

Use `gh repo view --json nameWithOwner -q .nameWithOwner` to get the owner/repo.

Get the PR's base branch: `gh pr view --json baseRefName -q .baseRefName` — use this instead of assuming `main` for any diff operations.

### 3. Identify Actionable Comments

Filter down to comments that are actionable — requests for changes, questions that imply something should change, or suggestions. Ignore:
- Simple approvals or acknowledgments ("LGTM", "looks good", etc.)
- Bot-generated comments (CI status, coverage reports, etc.)
- Comments that have already been resolved (if the API indicates resolution)

Group comments by file and present a numbered summary to the user:

```
## PR #123: <title>
<url>

### Comments to Address

1. **path/to/file.ts:42** — @reviewer
   > The comment text here

2. **path/to/other.ts:15** — @reviewer
   > Another comment

### Informational (no action needed)
- @someone: "Looks good!"
```

### 4. Address Comments

If `--dry-run` was passed, stop after showing the summary.

Otherwise, work through each actionable comment:
1. Read the file and surrounding context
2. Understand what the reviewer is asking for. If a comment is ambiguous or you're unsure what the reviewer wants, skip it and list it separately as "Needs clarification" in the summary.
3. Make the change
4. Briefly note what you did for each comment

After addressing all comments, show a summary of changes made.

Present the summary grouped by comment, showing:
- The original comment
- What you changed
- Any comments you skipped and why

Ask the user if they want to stage and commit the changes as a single "address review feedback" commit.

Do NOT commit the changes — let the user review first.

If the changes were substantial, suggest running `/review` before pushing to catch any issues introduced while addressing feedback.