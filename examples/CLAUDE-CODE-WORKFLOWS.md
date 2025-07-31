# CS-AgentOS Claude Code Workflows Guide

This guide provides comprehensive workflows for using CS-AgentOS with Claude Code, leveraging specialized subagents and advanced context management for enterprise-grade development.

## Table of Contents
1. [Getting Started with Claude Code](#getting-started-with-claude-code)
2. [Understanding Claude Code's Unique Architecture](#understanding-claude-codes-unique-architecture)
3. [Example Workflows](#example-workflows)
   - [Flutter Weather App with Advanced Testing](#example-1-flutter-weather-app-with-advanced-testing)
   - [Enterprise Tax/Accounting Platform](#example-2-enterprise-taxaccounting-platform)
   - [AI-Powered Multi-Agent Support System](#example-3-ai-powered-multi-agent-support-system)
4. [Claude Code Best Practices](#claude-code-best-practices)
5. [Leveraging Specialized Subagents](#leveraging-specialized-subagents)

## Getting Started with Claude Code

### Prerequisites
- Claude Code CLI access (claude.ai/code)
- CS-AgentOS Claude Code integration installed
- Git configured for your repository
- Node.js/Python/Flutter SDK (depending on your project)

### Installation Steps

1. **Install CS-AgentOS for Claude Code:**
   ```bash
   curl -sSL https://raw.githubusercontent.com/Cyarun/Cynor-agentOS/main/setup-claude-code.sh | bash
   ```

2. **Verify Installation:**
   ```bash
   # Check that commands are available
   ls ~/.claude/commands/
   # Should show: plan-product.md, create-spec.md, execute-tasks.md, analyze-product.md

   # Check specialized agents
   ls ~/.claude/agents/
   # Should show: context-fetcher.md, file-creator.md, git-workflow.md, test-runner.md, etc.
   ```

3. **Initialize in Your Project:**
   ```bash
   cd your-project-directory
   # Use the Claude Code command reference
   /plan-product
   ```

## Understanding Claude Code's Unique Architecture

### Specialized Subagents System
Claude Code uses 6 specialized agents that handle specific domains:

1. **`context-fetcher`** - Smart file content retrieval with deduplication
2. **`file-creator`** - Batch file creation with templates
3. **`git-workflow`** - Complete Git operations and PR management
4. **`test-runner`** - Task-specific test execution
5. **`governance-reviewer-agent`** - AI-powered code review
6. **`linter-agent`** - Static analysis integration

### Command Pattern
Claude Code commands are **instruction references**, not direct prompts:
```
/plan-product → References @~/.agent-os/instructions/plan-product.md
/create-spec → References @~/.agent-os/instructions/create-spec.md
```

## Example Workflows

### Example 1: Flutter Weather App with Advanced Testing

**Concept**: Build a Flutter weather app with comprehensive testing, leveraging Claude Code's TDD workflow and specialized test-runner agent.

#### Step 1: Initialize with Claude Code
```
/plan-product

When prompted, provide:
Main idea: Flutter weather app with location-based forecasts, offline support, and weather alerts

Key features:
- Real-time weather data with caching
- Location-based weather tracking
- Offline mode with local storage
- Push notifications for weather alerts
- Beautiful animations for weather conditions

Target users: Commuters, outdoor enthusiasts, travelers

Tech stack: Flutter, Firebase, OpenWeatherMap API, Hive for local storage
```

#### Step 2: Observe Claude Code's Specialized Workflow

Claude Code will:
1. **Use `file-creator` agent** to generate the complete `.agent-os/product/` structure
2. **Create condensed files** (`mission-lite.md`, `spec-lite.md`) for context efficiency
3. **Generate comprehensive roadmap** with TDD approach

Expected output:
```
✅ Created .agent-os/product/ directory structure
✅ Generated mission.md with product vision
✅ Created mission-lite.md (condensed for AI context)
✅ Documented tech-stack.md with your choices
✅ Built roadmap.md with 5 development phases
✅ Initialized decisions.md with override priority
```

#### Step 3: Create Feature Spec with TDD Focus
```
/create-spec

Spec: Current location weather display with offline caching and animated weather icons
```

Claude Code's unique approach:
- **Date determination** via file system timestamp
- **Spec folder creation**: `.agent-os/specs/2025-01-29-weather-display/`
- **TDD task structure** with test-first approach

#### Step 4: Execute with Test-Runner Agent
```
/execute-tasks

Task 1: Implement weather service with offline caching
```

Observe Claude Code's execution pattern:
```
1. Context Analysis (using context-fetcher agent)
   - Loads ONLY relevant specs
   - Avoids re-reading already loaded content

2. Git Branch Management (using git-workflow agent)
   - Creates branch: weather-display
   - Handles uncommitted changes

3. TDD Implementation (using test-runner agent)
   - Writes tests FIRST
   - Implements feature
   - Runs ONLY task-specific tests
   - Provides failure analysis

4. Full Test Suite Verification
   - Ensures no regressions
   - 100% pass rate required

5. Git Workflow (using git-workflow agent)
   - Creates descriptive commit
   - Pushes to remote
   - Creates detailed PR
```

#### Expected Project Structure:
```
weather-app/
├── .agent-os/
│   ├── product/
│   │   ├── mission.md
│   │   ├── mission-lite.md      # Condensed for AI
│   │   ├── tech-stack.md
│   │   ├── roadmap.md
│   │   └── decisions.md
│   └── specs/
│       └── 2025-01-29-weather-display/
│           ├── spec.md
│           ├── spec-lite.md     # Condensed for AI
│           ├── tasks.md         # TDD task breakdown
│           └── sub-specs/
│               └── technical-spec.md
├── lib/
│   ├── main.dart
│   ├── services/
│   │   ├── weather_service.dart
│   │   └── cache_service.dart
│   └── widgets/
│       └── weather_display.dart
├── test/
│   ├── services/
│   │   ├── weather_service_test.dart
│   │   └── cache_service_test.dart
│   └── widgets/
│       └── weather_display_test.dart
└── pubspec.yaml
```

### Example 2: Enterprise Tax/Accounting Platform

**Concept**: Build an enterprise-grade multi-tenant platform using Claude Code's governance and quality assurance features.

#### Step 1: Analyze Existing Codebase (if applicable)
```
/analyze-product

Claude Code will:
1. Deep codebase analysis
2. Technology detection
3. Architecture understanding
4. Generate Agent OS structure matching existing patterns
```

#### Step 2: Create Architecture Spec
```
/create-spec

Spec: Multi-tenant database architecture with row-level security, audit logging, and GDPR compliance
```

Claude Code's governance approach:
- **Technical spec generation** with security considerations
- **Database schema** with audit columns
- **API spec** with authentication details
- **Compliance documentation**

#### Step 3: Implement with Governance Pipeline
```
/execute-tasks

Implement multi-tenant database layer with audit logging
```

Claude Code's enterprise workflow:
```
1. Governance Check (governance-reviewer-agent)
   - Reviews proposed implementation
   - Validates security patterns
   - Ensures compliance requirements

2. Implementation Phase
   - Test-first development
   - Security-focused coding
   - Audit trail implementation

3. Quality Assurance (linter-agent + tester-agent)
   - Static analysis with security rules
   - Comprehensive test coverage
   - Performance benchmarks

4. AI Peer Review (governance-reviewer-agent)
   - Logic validation
   - Security review
   - Best practices check

5. PR Creation with Full Documentation
   - Security considerations
   - Compliance checklist
   - Performance metrics
```

#### Advanced Claude Code Commands:
```
# Create comprehensive security spec
/create-spec
Security layer with JWT tokens, refresh tokens, and role-based access control

# Execute with specific focus
/execute-tasks
Implement JWT authentication with secure token storage and rotation

# Run governance validation
/execute-tasks
Run full governance pipeline and create PR with compliance documentation
```

### Example 3: AI-Powered Multi-Agent Support System

**Concept**: Build a sophisticated multi-agent system leveraging Claude Code's agent orchestration capabilities.

#### Step 1: Design Multi-Agent Architecture
```
/plan-product

AI-powered customer support system with specialized agents:
- Routing agent (supervisor)
- FAQ agent with knowledge base
- Booking agent with calendar integration
- Complaint handler with escalation
- Analytics agent for insights
```

#### Step 2: Create Agent Infrastructure Spec
```
/create-spec

Base agent framework with message routing, context management, and inter-agent communication
```

Claude Code generates:
- **Agent base classes** with standardized interfaces
- **Message broker** architecture
- **Context preservation** system
- **Error handling** patterns

#### Step 3: Implement Individual Agents
```
# First agent - Supervisor/Router
/execute-tasks
Implement supervisor agent with intelligent routing based on intent classification

# Claude Code workflow:
1. Uses context-fetcher to load ONLY supervisor-related specs
2. Implements with test-runner focusing on routing logic
3. Creates comprehensive routing tests
```

```
# Second agent - FAQ Handler
/execute-tasks
Create FAQ agent with vector database for semantic search

# Specialized workflow:
1. file-creator generates agent structure
2. Implements vector search integration
3. test-runner validates search accuracy
```

#### Progressive Multi-Agent Development:
```
# Add agent communication
/create-spec
Inter-agent communication protocol with event-driven architecture

/execute-tasks
Implement pub/sub messaging between agents

# Add monitoring
/create-spec
Agent performance monitoring with metrics collection

/execute-tasks
Add telemetry and performance tracking to all agents
```

#### Claude Code's Multi-Agent Advantages:
1. **Modular testing** - Each agent tested independently
2. **Context isolation** - Agents don't pollute each other's context
3. **Incremental deployment** - Deploy agents progressively
4. **Governance per agent** - Quality checks for each component

## Claude Code Best Practices

### 1. Leverage Context Efficiency
```
# Claude Code automatically:
- Uses mission-lite.md instead of full mission.md
- Loads only task-relevant sub-specs
- Avoids re-reading files already in context
- Results in 60-80% context reduction
```

### 2. Trust the TDD Workflow
```
# Task structure Claude Code generates:
- [ ] 1. Weather Display Component
  - [ ] 1.1 Write tests for weather display widget
  - [ ] 1.2 Implement weather display component
  - [ ] 1.3 Add animation support
  - [ ] 1.4 Verify all tests pass
```

### 3. Use Specialized Agents Effectively
```
# Let specialized agents handle their domains:
- file-creator: Batch file creation
- git-workflow: All Git operations
- test-runner: Test execution and analysis
- context-fetcher: Smart file reading
```

### 4. Follow the Governance Pipeline
```
# For enterprise projects:
1. Enable governance agents in tech-stack.md
2. Let AI review happen automatically
3. Address feedback before PR creation
4. Maintain audit trail
```

## Leveraging Specialized Subagents

### Context-Fetcher Agent
Best for:
- Loading specific sections of files
- Avoiding context duplication
- Retrieving scattered information

Example usage in specs:
```xml
IF has_context_fetcher:
  USE: @agent:context-fetcher
  REQUEST: "Get database schema from technical-spec.md"
  PROCESS: Use returned schema
```

### File-Creator Agent
Best for:
- Creating multiple files with consistent structure
- Generating boilerplate code
- Setting up new components

Pattern:
```
Creates standardized file structures:
- Specs with all sub-specs
- Test files with proper imports
- Component scaffolding
```

### Git-Workflow Agent
Handles:
- Branch creation and switching
- Commit message generation
- PR creation with templates
- Branch cleanup

Workflow:
```
1. Checks current branch
2. Creates feature branch if needed
3. Commits with conventional format
4. Creates detailed PR
```

### Test-Runner Agent
Features:
- Task-specific test execution
- Failure analysis without fixing
- Performance insights
- Coverage reporting

Usage:
```
# Runs only tests for current task
# Provides actionable failure information
# Maintains focus on TDD cycle
```

## Advanced Claude Code Patterns

### 1. Conditional Agent Usage
```xml
<agent_detection>
  SET has_test_runner = (Claude Code AND test-runner agent exists)
  IF has_test_runner:
    USE: @agent:test-runner
  ELSE:
    FALLBACK: Manual test execution
</agent_detection>
```

### 2. Context-Aware Loading
```xml
<conditional_loading>
  IF roadmap.md NOT in context:
    LOAD @.agent-os/product/roadmap.md
  ELSE:
    SKIP loading (use existing context)
</conditional_loading>
```

### 3. Task Orchestration
```
FOR each parent_task:
  EXECUTE with execute-task.md:
    - Load minimal context
    - Run TDD cycle
    - Update task status
  CONTINUE until all complete
```

## Troubleshooting

### Common Issues

1. **Agent Not Found**
   - Ensure setup-claude-code.sh completed successfully
   - Check ~/.claude/agents/ directory
   - Fallback will activate automatically

2. **Context Overflow**
   - Use lite files (mission-lite.md, spec-lite.md)
   - Break large specs into smaller ones
   - Trust context-fetcher to load selectively

3. **Test Failures**
   - test-runner provides specific failure analysis
   - Fix tests before proceeding
   - Never skip the TDD cycle

## Conclusion

Claude Code with CS-AgentOS provides an enterprise-grade development workflow with:
- **Specialized agent delegation** for complex operations
- **60-80% context efficiency** through smart loading
- **TDD-first approach** with task-specific testing
- **Complete Git automation** with governance
- **Enterprise features** like AI peer review

This makes Claude Code ideal for teams requiring high code quality, systematic development practices, and comprehensive testing strategies.

For more information, visit the [CS-AgentOS repository](https://github.com/Cyarun/Cynor-agentOS).