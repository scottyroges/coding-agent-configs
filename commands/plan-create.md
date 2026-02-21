Create a new work plan.

Usage:
  /plan-create                              — create a plan interactively
  /plan-create "Refactor auth to OAuth2"    — create a plan with a title

Follow the plan format, file naming, and location conventions defined in the plans skill.

Steps:

1. If no title was given, ask: "What's the goal in one sentence?"
2. Ask: "Any initial thoughts on approach or phases?" — if the user has context, capture it. If not, move on.
3. Create the plan file following the plans skill conventions. Set status to "Not Started" and created date to today.
4. For phases: if the user provided approach details, break them into phases. Otherwise, create a single "Phase 1" placeholder with the goal restated.
5. Capture any open questions from the conversation. If none came up, use "None yet".
6. Update `.personal/docs/INDEX.md` if it doesn't already reference the new plan.
7. Show the user the created file.
8. Suggest: "Want me to run `/plan-review` to check for gaps and suggest how to split this into PRs?"
