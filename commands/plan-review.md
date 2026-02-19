Review a plan before implementation: surface unclear areas, open questions, and things to discuss.

Usage:
  /plan-review                                 — review the lowest numbered plan in docs/plans/active/
  /plan-review docs/plans/active/0.4-auth.md   — review a plan file
  /plan-review "Add OAuth login with Google"   — review a plan described inline

Options:
  /plan-review --context docs/architecture/system-overview.md — provide extra context files

Dispatch this to the plan-reviewer agent. Pass the plan (file path or inline text) and any context files.

After the review, ask the user if they want to update the plan file with resolutions to any open questions.