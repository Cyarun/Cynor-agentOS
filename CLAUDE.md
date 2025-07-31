# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

CS-AgentOS (formerly AgentOS) is a framework for spec-driven AI-assisted development that provides structured workflows, standards, and specifications to make AI coding agents more productive. It supports multiple AI platforms including Claude Code, Cursor, and Gemini CLI.

## Development Commands

### Agent OS Core Commands
- `/plan-product` - Initialize new product planning and create Agent OS structure
- `/create-spec` - Plan new features with detailed specifications  
- `/execute-tasks` - Build and ship code following TDD workflow
- `/analyze-product` - Add Agent OS to existing codebases

### Shell Script Execution
Run setup scripts with proper permissions:
```bash
chmod +x setup*.sh
./setup.sh  # Base installation
./setup-claude-code.sh  # Claude Code specific setup
```

## Architecture & Structure

### Core Framework Components

**Standards System** (`/standards/`)
- `tech-stack.md` - Defines default technology choices
- `code-style.md` - Language-agnostic formatting rules  
- `best-practices.md` - Development principles
- `code-style/` - Language-specific style guides (html, css, javascript)

**Instruction System** (`/instructions/`)
- `plan-product.md` - Product initialization workflow (v4.0)
- `create-spec.md` - Feature specification workflow (v1.1)
- `execute-tasks.md` - Task orchestration (v1.0)
- `execute-task.md` - Individual task execution
- `analyze-product.md` - Existing codebase analysis

**Platform Integrations**
- `/claude-code/` - Claude Code agents, commands, and user config
- `/gemini-cli/` - Gemini CLI commands and specialized agents
- `/cursor/` - Cursor IDE integration (via setup script)

### Specialized Agent Architecture (Claude Code)

Agent OS uses a distributed agent system with automatic fallback:
- **Main orchestrator** - Handles complex workflows
- **Specialized subagents** - Focused tools for specific tasks:
  - `test-runner` - Test execution and failure analysis
  - `context-fetcher` - Efficient file content retrieval
  - `git-workflow` - Git operations and PR creation
  - `file-creator` - Batch file creation with templates

Each agent has conditional detection patterns to ensure graceful fallback for non-Claude Code users.

### Workflow Data Flow

1. **Product Planning** creates in `.agent-os/product/`:
   - `mission.md` / `mission-lite.md` (condensed)
   - `tech-stack.md` 
   - `roadmap.md`
   - `decisions.md` (highest override priority)

2. **Feature Specs** create in `.agent-os/specs/YYYY-MM-DD-spec-name/`:
   - `spec.md` / `spec-lite.md` (condensed)
   - `sub-specs/technical-spec.md`
   - `sub-specs/database-schema.md` (conditional)
   - `sub-specs/api-spec.md` (conditional)
   - `tasks.md` (TDD task breakdown)

3. **Task Execution** follows TDD pattern:
   - Context loading (conditional to avoid duplication)
   - Development server management
   - Git branch management  
   - Test-first implementation
   - Automated PR creation

## Key Implementation Patterns

### Conditional Context Loading
Instructions use XML blocks to conditionally load files only when not already in context, reducing token usage by 60-80%.

### Agent Detection Pattern
```xml
<agent_detection>
  <check_once>
    AT START OF PROCESS:
    SET has_file_creator = (Claude Code AND file-creator agent exists)
    USE these flags throughout execution
  </check_once>
</agent_detection>
```

### Lite File Pattern
Critical documents have condensed versions (`mission-lite.md`, `spec-lite.md`) for efficient AI context usage.

### Override Hierarchy
`decisions.md` has highest priority, overriding any conflicting instructions in Claude memories or Cursor rules.

## Working with Agent OS

When modifying Agent OS itself:
1. Maintain XML-based instruction format with proper structure
2. Update version numbers in instruction file headers
3. Ensure backward compatibility for existing users
4. Test with multiple AI platforms (Claude Code, Cursor, Gemini)
5. Update CHANGELOG.md with significant changes
6. Follow the established code style (2-space indent, no tabs)

When using Agent OS in projects:
1. Start with `/plan-product` or `/analyze-product`
2. Use `/create-spec` for each feature
3. Execute with `/execute-tasks`
4. Let specialized agents handle their domains
5. Trust the TDD workflow and test verification