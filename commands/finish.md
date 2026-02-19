Wrap up current work: update docs, generate a commit message, and commit.

Usage:
  /finish                — finish staged changes
  /finish "context"      — include additional context for the commit message

Steps:

1. **Update docs** — Dispatch to the doc-updater agent for the current staged changes (git diff --cached). If nothing is staged, stage all changes first with `git add -A`, then run doc-updater on the full diff.

2. **Show doc updates** — Display the doc-updater's summary to the user (which files were updated/created and why).

3. **Stage doc updates** — Stage any new or modified doc files the doc-updater created.

4. **Check active plans** — If changes relate to an active plan in `.personal/docs/plans/active/`, remind the user: "This looks related to [plan]. Want to update its status before committing?"

5. **Generate commit message** — Dispatch to the pr-writer agent for all staged changes. If the user provided a description in quotes, pass it as context.
  - Options: commit as-is, edit the message, stage more files, or abort

6. **Present for approval** — Show the user:
   - Files that will be committed (git diff --cached --stat)
   - The proposed commit message
   - Ask: "Commit with this message? (or suggest changes)"

7. **Commit** — Only after the user approves, run `git commit` with the approved message.

Do NOT commit without explicit user approval. The whole point is to review before finalizing.
