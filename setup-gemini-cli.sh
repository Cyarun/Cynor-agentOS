#!/bin/bash

# Agent OS Gemini CLI Setup Script
# This script installs the official Google Gemini CLI and integrates it with Agent OS

set -e  # Exit on error

echo "🚀 Agent OS Gemini CLI Setup"
echo "==========================="
echo ""

# Check if Agent OS base installation is present
if [ ! -d "$HOME/.agent-os/instructions" ] || [ ! -d "$HOME/.agent-os/standards" ]; then
    echo "⚠️  Agent OS base installation not found!"
    echo ""
    echo "Please install the Agent OS base installation first:"
    echo ""
    echo "Option 1 - Automatic installation:"
    echo "  curl -sSL https://raw.githubusercontent.com/buildermethods/agent-os/main/setup.sh | bash"
    echo ""
    echo "Option 2 - Manual installation: (Follow instructions at https://buildermethods.com/agent-os)"
    echo ""
    exit 1
fi

# Install official Google Gemini CLI
echo "Installing official Google Gemini CLI..."
if command -v npm &> /dev/null; then
    npm install -g @google/gemini-cli
    echo "✓ Google Gemini CLI installed via npm."
elif command -v brew &> /dev/null; then
    brew install gemini-cli
    echo "✓ Google Gemini CLI installed via Homebrew."
else
    echo "⚠️  npm or Homebrew not found. Please install one of them to proceed with Gemini CLI installation."
    exit 1
fi
echo ""

# Base URL for raw GitHub content
BASE_URL="https://raw.githubusercontent.com/buildermethods/agent-os/main"

# Create directories
echo "📁 Creating directories..."
mkdir -p "$HOME/.gemini/commands"
mkdir -p "$HOME/.gemini/agents"
echo ""

# Create a default settings.json if it doesn't exist
if [ ! -f "$HOME/.gemini/settings.json" ]; then
    echo "📝 Creating default ~/.gemini/settings.json..."
    cat << EOF > "$HOME/.gemini/settings.json"
{
  // This file configures the Gemini CLI. You can define tools and MCPs here.
  // Tools defined here are globally available to the Gemini model when run via the CLI.
  // For more information, see: https://github.com/google/gemini-cli#configuration

  // Example of a custom tool (replace with your actual tool definitions):
  // "tools": [
  //   {
  //     "name": "myCustomTool",
  //     "description": "A description of what your tool does.",
  //     "parameters": {
  //       "type": "object",
  //       "properties": {
  //         "arg1": {"type": "string", "description": "First argument"}
  //       }
  //     },
  //     "function": "(arg1) => { /* Your JavaScript/TypeScript code to execute the tool */ }"
  //   }
  // ],

  // Example of an MCP server (replace with your actual MCP configuration):
  // "mcp": [
  //   {
  //     "name": "myMcpServer",
  //     "url": "http://localhost:8080",
  //     "description": "Description of your MCP server."
  //   }
  // ]
}
EOF
    echo "  ✓ ~/.gemini/settings.json created. Please review and configure your tools/MCPs."
else
    echo "  ⚠️  ~/.gemini/settings.json already exists - skipping creation."
fi
echo ""

# Download command files for Agent OS
echo "📥 Downloading Agent OS command files to ~/.gemini/commands/"
for cmd in analyze-product create-spec execute-tasks plan-product; do
    if [ -f "$HOME/.gemini/commands/${cmd}.toml" ]; then
        echo "  ⚠️  ~/.gemini/commands/${cmd}.toml already exists - skipping"
    else
        curl -s -o "$HOME/.gemini/commands/${cmd}.toml" "${BASE_URL}/gemini-cli/commands/${cmd}.toml"
        echo "  ✓ ~/.gemini/commands/${cmd}.toml"
    fi
done
echo ""

# Download Gemini CLI user GEMINI.md
echo "📥 Downloading Gemini CLI configuration to ~/.gemini/"
if [ -f "$HOME/.gemini/GEMINI.md" ]; then
    echo "  ⚠️  ~/.gemini/GEMINI.md already exists - skipping"
else
    curl -s -o "$HOME/.gemini/GEMINI.md" "${BASE_URL}/gemini-cli/user/GEMINI.md"
    echo "  ✓ ~/.gemini/GEMINI.md"
fi
echo ""

# Download Gemini-specific agents
echo "📥 Downloading Gemini-specific agents to ~/.gemini/agents/"
agents=("cloud-config-generator" "github-issue-manager" "governance-agent") # These are the actual Gemini-specific agents
for agent in "${agents[@]}"; do
    if [ -f "$HOME/.gemini/agents/${agent}.md" ]; then
        echo "  ⚠️  ~/.gemini/agents/${agent}.md already exists - skipping"
    else
        curl -s -o "$HOME/.gemini/agents/${agent}.md" "${BASE_URL}/gemini-cli/agents/${agent}.md"
        echo "  ✓ ~/.gemini/agents/${agent}.md"
    fi
done
echo ""

echo "✅ Agent OS Gemini CLI installation complete!"
echo ""
echo "📍 Files installed to:"
echo "   ~/.gemini/commands/        - Agent OS commands for Gemini"
echo "   ~/.gemini/agents/          - Gemini-specific specialized agents"
echo "   ~/.gemini/GEMINI.md        - Gemini CLI configuration for Agent OS"
echo "   ~/.gemini/settings.json    - Gemini CLI global settings (for tools/MCPs)"
echo ""
echo "Next steps for Agentic Coding with Gemini CLI:"
echo ""
echo "1. **Authenticate the Gemini CLI:** If you haven't already, run:"
echo "   gemini auth login"
echo "   (This connects the Gemini CLI to your Google account/API key.)"
echo ""
echo "2. **Configure Tools and MCPs (Optional but Recommended):"
echo "   Edit ~/.gemini/settings.json to define custom tools or connect to MCP servers."
echo "   These tools will be globally available to the Gemini model when it executes Agent OS commands."
echo "   Example: Add tools for linting, testing, or custom API interactions."
echo ""
echo "3. **Start Agentic Coding!**"
echo "   You can now use the 'gemini' executable to run high-level Agent OS commands."
echo "   The Gemini model will leverage its intelligence, the context from your Agent OS files, and configured tools/MCPs to perform complex tasks."
echo ""
echo "   Examples:"
echo "   gemini plan-product \"Develop a new mobile app for task management\""
echo "   gemini execute-tasks \"Fix bug #123 in the user authentication module\""
echo ""
echo "   (Refer to ~/.gemini/GEMINI.md for more details on available commands and usage.)"
echo ""
echo "Learn more about CS-AgentOS at https://cynorsense.com/CS-AgentOS"
echo ""