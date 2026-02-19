#!/usr/bin/env bash
# Interactively symlink repo configs into ~/.claude

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE="$HOME/.claude"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
DIM='\033[2m'
RESET='\033[0m'

ask() {
  local prompt="$1"
  local response
  while true; do
    printf "  %s [y/n] " "$prompt"
    read -r response
    case "$response" in
      y|Y) return 0 ;;
      n|N) return 1 ;;
      *) printf "  Please enter y or n\n" ;;
    esac
  done
}

link_item() {
  local src="$1"   # full path in repo
  local dest="$2"  # full path in ~/.claude

  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    local current
    current=$(readlink "$dest")
    if [ "$current" = "$src" ]; then
      printf "    ${DIM}already linked, skipping${RESET}\n"
      return
    else
      printf "    ${YELLOW}replacing existing symlink${RESET} (was: %s)\n" "$current"
      rm "$dest"
    fi
  elif [ -e "$dest" ]; then
    printf "    ${YELLOW}warning: real file exists at %s${RESET}\n" "$dest"
    if ask "Overwrite it?"; then
      rm -rf "$dest"
    else
      printf "    skipped\n"
      return
    fi
  fi

  ln -s "$src" "$dest"
  printf "    ${GREEN}linked${RESET}\n"
}

printf "\n${CYAN}Claude Config Symlinker${RESET}\n"
printf "${DIM}Repo: %s${RESET}\n" "$REPO"
printf "${DIM}Target: %s${RESET}\n\n" "$CLAUDE"

# --- CLAUDE.md ---
printf "${CYAN}CLAUDE.md${RESET}\n"
if ask "Symlink CLAUDE.md → ~/.claude/CLAUDE.md?"; then
  link_item "$REPO/CLAUDE.md" "$CLAUDE/CLAUDE.md"
fi
printf "\n"

# --- Agents (each is a directory) ---
if [ -d "$REPO/agents" ]; then
  printf "${CYAN}Agents${RESET}\n"
  for agent_dir in "$REPO/agents"/*/; do
    [ -d "$agent_dir" ] || continue
    name=$(basename "$agent_dir")
    printf "  %s\n" "$name"
    if ask "Symlink agents/$name → ~/.claude/agents/$name?"; then
      link_item "$agent_dir" "$CLAUDE/agents/$name"
    fi
  done
  printf "\n"
fi

# --- Commands (individual files) ---
if [ -d "$REPO/commands" ]; then
  printf "${CYAN}Commands${RESET}\n"
  for cmd_file in "$REPO/commands"/*.md; do
    [ -f "$cmd_file" ] || continue
    name=$(basename "$cmd_file")
    printf "  %s\n" "$name"
    if ask "Symlink commands/$name → ~/.claude/commands/$name?"; then
      link_item "$cmd_file" "$CLAUDE/commands/$name"
    fi
  done
  printf "\n"
fi

# --- Skills (each is a directory) ---
if [ -d "$REPO/skills" ]; then
  printf "${CYAN}Skills${RESET}\n"
  for skill_dir in "$REPO/skills"/*/; do
    [ -d "$skill_dir" ] || continue
    name=$(basename "$skill_dir")
    printf "  %s\n" "$name"
    if ask "Symlink skills/$name → ~/.claude/skills/$name?"; then
      link_item "$skill_dir" "$CLAUDE/skills/$name"
    fi
  done
  printf "\n"
fi

printf "${GREEN}Done.${RESET}\n\n"
