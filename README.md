# Claude Code Configs

Personal Claude Code configuration: agents, commands, and skills. Designed to work across multiple machines with different doc setups.

## Setup

### 1. Symlink configs into ~/.claude

```bash
./symlink.sh
```

Interactively symlinks CLAUDE.md, agents, commands, and skills into `~/.claude/`.

### 2. Set up a global gitignore

Agents reference `.personal/docs/` for all documentation. This directory is personal and machine-local — never committed.

```bash
echo ".personal" >> ~/.gitignore_global
git config --global core.excludesFile ~/.gitignore_global
```

### 3. Per-project: set up .personal/docs

In each project, run:

```bash
mkdir -p .personal/docs
```

**On your work computer** — that's it. `.personal/docs/` is the real directory, git-excluded.

**On your personal computer** (where you own the docs and commit them) — symlink instead:

```bash
mkdir -p .personal
ln -s ../docs .personal/docs
```

This makes `.personal/docs` point to the committed `docs/` directory. Agents write to `.personal/docs/` and the files land in `docs/`, where they get committed normally.

## What's included

### Agents

| Agent | Purpose |
|---|---|
| `codebase-explorer` | Maps architecture and explains how parts of the codebase work |
| `code-reviewer` | Reviews code changes for spec compliance and quality |
| `doc-updater` | Updates `.personal/docs/` to reflect code changes |
| `plan-reviewer` | Reviews plans before implementation for gaps and risks |
| `pr-writer` | Writes PR descriptions and commit messages from diffs |
| `reflect` | Extracts session insights and routes them to the right place |
| `test-runner` | Runs tests and returns a concise summary of results |

### Commands (slash commands)

| Command | Purpose |
|---|---|
| `/catchup` | Show current project state to orient at session start |
| `/codebase-explorer` | Map the codebase for a feature or area |
| `/finish` | Update docs, generate a commit message, and commit |
| `/plan-review` | Review a plan before implementation |
| `/pr-comments` | Address open PR review comments |
| `/pr-description` | Generate a PR description from current changes |
| `/pr-review` | Review code changes in two stages |
| `/reflect` | Review the session and extract reusable insights |
| `/update-docs` | Update docs for recent changes |

### Skills

| Skill | Purpose |
|---|---|
| `project-scaffold` | Scaffold a new project with preferred structure and Claude config |

## Docs convention

All agents use `.personal/docs/` as the documentation root. The structure within it:

```
.personal/docs/
├── INDEX.md          # routing map — what doc lives where
├── stack.md          # tech stack overview
├── architecture/     # architecture docs
├── decisions/        # ADRs
└── plans/
    ├── active/       # plans in progress
    └── completed/    # shipped plans
```

`INDEX.md` is the entry point agents consult before exploring. Keep it current.
