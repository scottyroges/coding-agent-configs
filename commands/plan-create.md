Create a new work plan in docs/plans/active/.

Usage:
  /plan-create                        — create a plan interactively
  /plan-create "Refactor auth to OAuth2"  — create a plan with a title

Steps:

1. If no title was given, ask the user: "What's the goal in one sentence?"

2. Ask: "Any initial thoughts on approach or phases?" — if the user has context, capture it. If not, move on.

3. Create the plan file at `.personal/docs/plans/active/<slug>.md` using this format:
```
# Plan: <title>

**Status:** Not Started
**Created:** <today's date>

## Goal
<one paragraph>

## Phases
- [ ] Phase 1: <description>

## Open Questions
- <any from the conversation, or "None yet">

## Files Modified
<empty — updated by /save-progress>

## Session Notes
<empty — updated by /save-progress>
```

4. Update `.personal/docs/INDEX.md` if it doesn't already reference the new plan.

5. Show the user the created file. Suggest: "Want me to run `/plan-review` to check for gaps and suggest how to split this into PRs?"