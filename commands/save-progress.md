Save current session progress to the active plan.

Usage:
  /save-progress                                      — update the most recent active plan
  /save-progress .personal/docs/plans/active/auth-refactor.md   — update a specific plan

Steps:

1. If no plan was specified, find the most recently modified file in `.personal/docs/plans/active/`. If none exist, ask the user if they want to create one (use /plan-create).

2. Read the plan file and `git log --oneline -10` and `git diff --stat HEAD~5` to understand what happened this session.

3. Update the plan with:
   - Tasks completed (check them off)
   - Current state and where to pick up next
   - Blockers or open questions discovered
   - Files modified this session

4. Show the user what changed in the plan before saving.

Keep updates concise — this is a handoff document, not a journal.