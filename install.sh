#!/usr/bin/env bash
# Install JimSkills into the current project's .claude/skills/ directory.
# Usage: run from your project root:
#   curl -fsSL https://raw.githubusercontent.com/jhackney24/JimSkills/main/install.sh | bash
set -euo pipefail

REPO="https://github.com/jhackney24/JimSkills.git"
DEST=".claude/skills"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Cloning JimSkills..."
git clone --depth 1 "$REPO" "$TMP/jimskills" >/dev/null 2>&1

mkdir -p "$DEST"
count=$(find "$TMP/jimskills/skills" -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d ' ')
cp -r "$TMP/jimskills/skills/." "$DEST/"
echo "Installed $count skills into $DEST/"
echo "Start a new Claude Code session to pick them up."
