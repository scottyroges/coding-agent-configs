Review a plan before implementation: surface unclear areas, open questions, and things to discuss.

Usage:
  /plan-review                                                    — review the current active plan
  /plan-review .personal/docs/plans/active/auth-refactor.md       — review a specific plan file
  /plan-review "Add OAuth login with Google"                      — review a plan described inline

Options:
  --context <file>    — provide extra context files (architecture docs, related plans, etc.)

Follow the plan location and resolution conventions defined in the plans skill.

Steps:

1. Resolve the plan target:
   - If a file path was given, use it.
   - If inline text was given, use that as the plan.
   - If nothing was given, resolve the current plan per the plans skill.
2. Dispatch to the **plan-reviewer** agent. Pass the plan (file path or inline text) and any context files.
3. After the review, ask: "Want to update the plan with resolutions to any of these open questions?"
4. If yes, apply the user's resolutions to the plan file and update the Open Questions section.
