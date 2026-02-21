# Skill: Work Plans

Work plans track implementation efforts from idea through completion. They're the shared format used by `/plan-create`, `/plan-review`, and `/save-progress`.

## File Location

- Active plans: `.personal/docs/plans/active/`
- Completed plans: `.personal/docs/plans/done/`

## File Naming

Kebab-case slug derived from the title. Strip filler words for brevity.

- "Refactor Auth to OAuth2" → `refactor-auth-to-oauth2.md`
- "Add Stripe Billing Integration" → `add-stripe-billing.md`

## Plan Format

```markdown
# Plan: <title>

**Status:** <status>
**Created:** <YYYY-MM-DD>

## Goal

<One paragraph describing what this plan achieves and why.>

## Phases and PR Splits

- [ ] Phase 1: <description>
- [ ] Phase 2: <description>

## Open Questions

- <question>

## Files Modified

<empty until updated by /save-progress>

## Session Notes

<empty until updated by /save-progress>
```

## Status Values

- **Not Started** — plan exists but no work has begun
- **In Progress** — actively being worked on
- **Blocked** — waiting on a decision, dependency, or external input
- **Done** — all phases complete; ready to move to `plans/done/`

## INDEX.md

`.personal/docs/INDEX.md` must reference every active plan. Update it when:

- A new plan is created
- A plan moves from `active/` to `done/`
- A plan is deleted or abandoned

## Resolving "Current Plan"

When a command doesn't specify which plan to use:

1. Use the most recently modified file in `.personal/docs/plans/active/`.
2. If no active plans exist, prompt the user to create one via `/plan-create`.
