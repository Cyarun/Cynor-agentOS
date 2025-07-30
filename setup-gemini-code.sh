#!/bin/bash

# Agent OS Gemini Code Setup Script
# This script installs Agent OS commands and configurations for Gemini CLI

set -e  # Exit on error

echo "🚀 Agent OS Gemini Code Setup"

# Base URL for raw GitHub content
BASE_URL="https://raw.githubusercontent.com/buildermethods/agent-os/main"

# Create directories in user's home for Gemini Agent OS files
mkdir -p "$HOME/.gemini/commands"
mkdir -p "$HOME/.gemini/agents"

# Download Gemini Code user GEMINI.md
echo "📥 Downloading Gemini Code configuration to ~/.gemini/"
if [ -f "$HOME/.gemini/GEMINI.md" ]; then
    echo "  ⚠️  ~/.gemini/GEMINI.md already exists - skipping"
else
    curl -s -o "$HOME/.gemini/GEMINI.md" "${BASE_URL}/gemini-code/user/GEMINI.md"
    echo "  ✓ ~/.gemini/GEMINI.md"
fi

# Placeholder for downloading Gemini Code commands (if any are created later)
# echo "📥 Downloading Gemini Code command files to ~/.gemini/commands/"
# for cmd in command1 command2; do
#     if [ -f "$HOME/.gemini/commands/${cmd}.md" ]; then
#         echo "  ⚠️  ~/.gemini/commands/${cmd}.md already exists - skipping"
#     else
#         curl -s -o "$HOME/.gemini/commands/${cmd}.md" "${BASE_URL}/gemini-code/commands/${cmd}.md"
#         echo "  ✓ ~/.gemini/commands/${cmd}.md"
#     fi
# done

# Placeholder for downloading Gemini Code agents (if any are created later)
# echo "📥 Downloading Gemini Code subagents to ~/.gemini/agents/"
# for agent in agent1 agent2; do
#     if [ -f "$HOME/.gemini/agents/${agent}.md" ]; then
#         echo "  ⚠️  ~/.gemini/agents/${agent}.md already exists - skipping"
#     else
#         curl -s -o "$HOME/.gemini/agents/${agent}.md" "${BASE_URL}/gemini-code/agents/${agent}.md"
#         echo "  ✓ ~/.gemini/agents/${agent}.md"
#     fi
# done

echo "✅ Agent OS Gemini Code installation complete!"
echo ""
echo "📍 Files installed to:"
echo "   ~/.gemini/commands/        - Gemini Code commands (placeholder)"
echo "   ~/.gemini/agents/          - Gemini Code specialized subagents (placeholder)"
echo "   ~/.gemini/GEMINI.md        - Gemini Code configuration"
echo ""
