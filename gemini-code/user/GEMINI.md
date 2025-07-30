# GEMINI.md

This file directs Gemini CLI to use your personal Agent OS standards for all development work. These global standards define your preferred way of building software across all projects.

## Agent OS Standards

*   **Code Style:** Adhere to the code style guidelines defined in `~/.agent-os/standards/code-style.md`.
*   **Best Practices:** Follow the best practices outlined in `~/.agent-os/standards/best-practices.md`.
*   **Tech Stack:** Utilize the technologies specified in `~/.agent-os/standards/tech-stack.md`.

## Gemini-Specific Directives

*   **Sandbox Mode:** For tasks involving potentially risky operations (e.g., file system modifications, shell commands), prioritize using Gemini's sandbox mode (requires Docker/Podman setup).
*   **Context Files:** Leverage `GEMINI.md` files within project directories to provide project-specific context and instructions to the Gemini CLI.
*   **Planning Capabilities:** For complex tasks, utilize Gemini's advanced reasoning and planning capabilities. Break down the task into smaller, manageable steps and present a high-level plan before execution.
*   **Built-in Tools:** Make use of Gemini's built-in tools like `ReadFile`, `WriteFile`, `Shell`, `GoogleSearch`, and `WebFetch` where appropriate.

## Agent OS Commands

Refer to the commands in `~/.gemini/commands/` (once implemented) for specific Agent OS functionalities integrated with Gemini.

## Subagents

Utilize specialized subagents in `~/.gemini/agents/` (once implemented) for specific tasks.