# AgentOS Best Practices & Governance Framework

This document outlines the mandatory principles and workflows for all development performed by an AgentOS-powered agent. These rules ensure quality, consistency, security, and transparency across all projects.

## 1. Project Lifecycle & Version Control

-   **Source of Truth:** GitHub is the single source of truth for all code.
-   **Issue-Driven Development:** All work must begin with a GitHub Issue. No feature, bug fix, or chore should be started without a corresponding issue.
-   **Branching Strategy:** All branches must be created from an issue and named using the pattern `issue/<issue-number>-<short-description>` (e.g., `issue/42-add-user-login`).
-   **Pull Requests:** Work is considered complete only when a Pull Request (PR) has been created, has passed all checks, and has been merged. The PR description must link to the issue it resolves.

## 2. Infrastructure & Environments

-   **Cloud-Native Deployment:** The target deployment environment is a pre-existing, remote **MCP (Multi-Cloud Platform) server**. The agent must not attempt to run services locally.
-   **Containerization:** All applications and services must be containerized using Docker. The agent is responsible for creating a `Dockerfile` for each service and a root `docker-compose.yml` to orchestrate them.
-   **Environment Management:** All projects must be designed with three environments in mind: `development`, `testing`, and `production`. Configuration for these environments must be managed via `.env` files (e.g., `.env.development`, `.env.production`) and must not be committed to version control.

## 3. Development Governance & Quality Assurance

This four-step process is **mandatory** for every task that involves writing or modifying code. It must be performed before a Pull Request is created.

-   **Principle 1: Automated Static Analysis**
    -   **Action:** The agent must run the appropriate linter on the code.
    -   **Tooling:** Use **Ruff** for Python and **ESLint/Prettier** for JavaScript/TypeScript.
    -   **Outcome:** The code must be free of any linting errors.

-   **Principle 2: Test-Driven Development (TDD)**
    -   **Action:** For any new logic, the agent must generate unit tests that validate its correctness. These tests should be written alongside or before the feature code.
    -   **Tooling:** Use **pytest** for Python and **Jest** or **Vitest** for JavaScript/TypeScript.
    -   **Outcome:** All tests must pass.

-   **Principle 3: AI Peer Review (Anti-Hallucination)**
    -   **Action:** After passing automated checks, the agent must perform a "self-critique." It will re-read the original GitHub Issue and the generated code to check for deviations, logical errors, or hallucinations.
    -   **Outcome:** The agent must confirm this review was completed and fix any issues it finds, re-running the automated checks afterward.

-   **Principle 4: Governance Reporting**
    -   **Action:** Upon successful completion of the first three principles, the agent must generate a `governance-report.md` file.
    -   **Content:** The report must contain:
        -   A link to the GitHub Issue.
        -   A high-level summary of the changes.
        -   The results of the test suite (e.g., "12/12 tests passed").
        -   The results of the linter (e.g., "No linting errors found").
        -   A confirmation statement that the AI Peer Review was completed successfully.
    -   **Outcome:** This report must be committed alongside the code and included in the Pull Request description. It is the primary artifact for human oversight.