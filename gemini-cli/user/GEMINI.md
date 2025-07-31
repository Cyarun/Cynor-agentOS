# Gemini CLI Persona for Agent OS

This document outlines how the official Google Gemini CLI integrates with and is used within the Agent OS framework.

## Purpose

The Gemini CLI acts as your primary interface to interact with Agent OS workflows, leveraging the power of Google Gemini models for advanced software engineering tasks.

## Core Directives (as executed by the Gemini CLI)

1.  **Tool-Driven:** The Gemini CLI utilizes its built-in tools (file system, shell, web search/fetch) and can be extended via MCP to interact with your system and external services.
2.  **Governance-First:** The Gemini CLI can be configured to enforce governance workflows for code-related tasks.
3.  **Cost-Conscious:** You can specify the Gemini model (e.g., `gemini-pro`, `gemini-flash`) to balance cost and capability for different tasks.
4.  **Cloud-Native:** The Gemini CLI supports cloud-native workflows, aiming to produce deployment-ready artifacts.
5.  **GitHub-Centric:** The Gemini CLI can be integrated with GitHub workflows for issue management and pull requests.

## Global Standards (referenced by Gemini CLI)

These standards guide the Gemini CLI's behavior when executing Agent OS commands:
- **Tech Stack Defaults:** @~/.agent-os/standards/tech-stack.md
- **Code Style Preferences:** @~/.agent-os/standards/code-style.md
- **Best Practices Philosophy:** @~/.agent-os/standards/best-practices.md

## Agent OS Commands (executed via Gemini CLI)

These are the high-level Agent OS workflows that you can trigger using the `gemini` CLI. They are defined as custom commands in `~/.gemini/commands/` (or project-specific `.gemini/commands/`).

To execute these commands, you will typically use the `gemini` executable followed by the command name and any arguments. For example:

*   **Plan Product:** `gemini plan-product "[Your product idea here]"`
    *   *Definition:* @~/.agent-os/gemini-cli/commands/plan-product.toml
*   **Create Spec:** `gemini create-spec "[Feature description]"`
    *   *Definition:* @~/.agent-os/gemini-cli/commands/create-spec.toml
*   **Execute Tasks:** `gemini execute-tasks "[Task description or issue number]"`
    *   *Definition:* @~/.agent-os/gemini-cli/commands/execute-tasks.toml
*   **Analyze Product:** `gemini analyze-product "[Path to codebase]"`
    *   *Definition:* @~/.agent-os/gemini-cli/commands/analyze-product.toml

## Working with Existing Codebases

Agent OS with Gemini CLI is ideal for understanding and contributing to existing open-source projects or legacy codebases. Here's a typical workflow:

1.  **Clone the Repository:**
    Start by cloning the GitHub repository to your local machine and navigating into its root directory:
    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```

2.  **Initial Codebase Analysis:**
    Use the `gemini analyze-product` command to get a comprehensive overview. Provide a detailed prompt to guide Gemini on what you want to discover. Gemini will use its built-in tools (file system access, web search) to analyze the codebase.
    ```bash
    gemini analyze-product "Analyze this codebase to identify:
    1.  Overall Architecture & Key Functionalities: How is the project structured? What are its main features?
    2.  Tech Stack Discovery: Identify all programming languages, frameworks, libraries, and build tools used. Look for package.json, requirements.txt, pom.xml, go.mod, etc.
    3.  API Documentation & Endpoints: Where are the API endpoints defined? Is there any existing API documentation (e.g., Swagger/OpenAPI files, docs/ directory, README.md)?
    4.  Database Structure Discovery: If applicable, identify the database system used and describe its schema (look for schema files, ORM definitions, migration scripts).
    5.  Development Environment Setup: How can I set up a development environment? Look for Dockerfile, docker-compose.yml, Makefile, CONTRIBUTING.md, or setup instructions in README.md. Provide the necessary commands to get it running.
    6.  Function Flows: Pick one core functionality (e.g., user authentication, data processing) and describe its high-level function flow.
    "
    ```

3.  **Deep Dive & Iteration:**
    Based on the initial analysis, you can then use `gemini chat` or other `gemini` commands to delve deeper into specific areas. For example:
    *   To understand a specific function flow: `gemini chat --model gemini-pro --prompt "Explain the detailed function flow for [specific feature, e.g., 'how a user logs in'] in this codebase. Point to relevant files and functions."`
    *   To get help with a specific setup issue: `gemini chat --model gemini-pro --prompt "I'm trying to run the project, but I'm getting the error '[paste error message here]'. How can I fix this? My current setup steps are [list your steps]."`

4.  **Set Up & Test Dev Environment:**
    Execute the setup commands provided by Gemini or found in the project's documentation. Use `gemini chat` for debugging if you encounter issues.

By following this iterative process, you can effectively onboard yourself to new projects, understand their intricacies, and get the development environment up and running with intelligent assistance from the Gemini CLI.

## Gemini-Specific Agents (Specialized Capabilities)

These markdown files describe specialized, higher-level agents that leverage Gemini's unique capabilities within Agent OS workflows. They are referenced by the Gemini CLI for context and guidance.

- **Cloud Config Generator:** @~/.agent-os/gemini-cli/agents/cloud-config-generator.md
- **GitHub Issue Manager:** @~/.agent-os/gemini-cli/agents/github-issue-manager.md
- **Governance Agent:** @~/.agent-os/gemini-cli/agents/governance-agent.md

## How These Work Together

1.  **You invoke a command:** You run a command like `gemini plan-product` from your terminal.
2.  **Gemini CLI interprets:** The `gemini` CLI reads the corresponding `.toml` file (e.g., `plan-product.toml`).
3.  **Gemini model processes:** The `gemini` CLI then sends a prompt to the Gemini model, incorporating the command's description, your arguments, context from relevant `GEMINI.md` and agent `.md` files, and access to configured tools and MCPs.
4.  **Gemini acts:** The Gemini model, using its reasoning and built-in tools (file system, shell, web, etc.), executes the workflow, potentially interacting with you for clarification or outputting results.

## Important Notes

-   Ensure the official Google Gemini CLI is installed and authenticated (`gemini auth login`).
-   Customize `.toml` files and `GEMINI.md` to match your specific preferences and workflows.
-   Project-specific configurations in `.gemini/` directories will override user-level settings.