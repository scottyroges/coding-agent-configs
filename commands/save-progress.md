Save current session progress to the active plan.

Usage:
  /save-progress                                                    — update the current active plan
  /save-progress .personal/docs/plans/active/auth-refactor.md       — update a specific plan

Follow the plan format, status values, and resolution conventions defined in the plans skill.

Steps:

1. Resolve the plan target:
   - If a file path was given, use it.
   - If nothing was given, resolve the current plan per the plans skill.
2. Read the plan file.
3. Run `git log --oneline -10` and `git diff --stat HEAD~5` to understand what happened this session.
4. Update the plan:
   - **Phases**: check off completed tasks, add new ones if work revealed them.
   - **Status**: update if it changed (e.g., Not Started → In Progress).
   - **Session Notes**: append a dated entry with current state and where to pick up next.
   - **Files Modified**: append files changed this session (from git diff).
   - **Open Questions**: add any blockers or questions discovered. Remove any that were resolved.
5. Show the user a diff of what changed in the plan before saving.
6. Keep updates concise — this is a handoff document, not a journal.
