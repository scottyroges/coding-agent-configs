---
name: project-scaffold
description: Scaffold a new project with preferred directory structure, documentation skeleton, and Claude Code configuration. Use when creating a new project from scratch or initializing an existing codebase with this structure.
---

# Project Scaffold

## When to Use

When the user asks to create a new project, initialize a project structure, or set up a codebase for the first time.

## Workflow

### Step 1: Understand the Project

Before scaffolding, ask the user:
- What is this project? (one sentence)
- What's the tech stack?
- Anything else Claude should know up front?

Don't over-interview. Three questions max, then scaffold.

### Step 2: Create Directory Structure

```
project-root/
├── CLAUDE.md
├── .gitignore
├── .personal/
│   └── .personal/docs/
│       ├── INDEX.md
│       ├── stack.md
│       ├── decisions/
│       ├── architecture/
│       └── plans/
│           ├── active/
│           └── completed/
└── .claude/
    ├── skills/
    ├── agents/
    └── commands/
```

Create all directories and seed files. Use the templates in `templates/` as starting points, adapting to what the user told you.

### Step 3: Seed the Files

**CLAUDE.md** — Use `templates/CLAUDE.md.template`. Keep it under 20 lines. Include:
- One-line project description
- Build/run/test commands (if known, otherwise leave TODO placeholders)
- Pointer to .personal/docs/INDEX.md
- Nothing else

**.personal/docs/INDEX.md** — Use `templates/INDEX.md.template`. This is the routing map Claude uses to find documentation. Seed it with the directory structure and placeholder descriptions.

**.personal/docs/stack.md** — Brief tech stack description based on what the user told you. 5-10 lines.

**.env.example** — Empty or with placeholder keys if the stack implies them (e.g., `DATABASE_URL=`, `API_KEY=`).

**.gitignore** — Standard for the stack, always including `.env`, `node_modules/`, `dist/`, `.DS_Store`, and any other stack-appropriate entries.

### Step 4: Confirm

Show the user what was created (directory listing) and remind them:
- CLAUDE.md has TODO placeholders to fill in once build/test commands are set up
- .personal/docs/ is seeded but should grow as the project takes shape
- .claude/ is ready for agents, skills, and commands — add them as the project takes shape
