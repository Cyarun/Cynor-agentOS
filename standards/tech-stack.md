# AgentOS Standardized Technology Stack

This document defines the default technology stacks for all new projects developed using AgentOS. The agent must adhere to these choices to ensure consistency, quality, and alignment with modern best practices.

## 1. Web Applications (Full-Stack)

This is the default stack for any web-based product, including SaaS platforms and marketing sites.

-   **Frontend Framework:** **Next.js (React)**
    -   *Reasoning:* Provides server-side rendering (SSR), static site generation (SSG), and a file-based routing system that is ideal for performance, SEO, and developer experience.
-   **UI/UX Components:** **Shadcn/UI with Tailwind CSS**
    -   *Reasoning:* Offers a set of beautifully designed, accessible, and unstyled components that can be easily customized. This approach provides maximum flexibility while ensuring a high-quality, modern aesthetic. The agent should draw design inspiration from `tweak.cn` and `21st.dev`.
-   **Backend API:** **FastAPI (Python)**
    -   *Reasoning:* High performance, asynchronous by nature, and provides automatic, interactive API documentation (via Swagger UI/ReDoc) for every endpoint, which is critical for maintainability and developer velocity.
-   **Primary Database:** **Supabase**
    -   *Reasoning:* An open-source Firebase alternative that provides a PostgreSQL database, authentication, object storage, and auto-generated APIs out of the box. This is the **mandatory** choice for all primary data storage.
-   **Vector Database:** **Qdrant**
    -   *Reasoning:* A high-performance, scalable vector database essential for any AI-powered search, retrieval, or long-term memory features. This is the **mandatory** choice for all vector storage needs.

## 2. Native Mobile Applications

This stack is to be used when the user requests a native mobile application for a specific platform.

-   **iOS Applications:**
    -   **Language:** Swift
    -   **UI Framework:** SwiftUI
    -   *Reasoning:* The modern, declarative, and official framework from Apple for building native UIs across all Apple platforms.
-   **Android Applications:**
    -   **Language:** Kotlin
    -   **UI Framework:** Jetpack Compose
    -   *Reasoning:* The modern, declarative, and official toolkit from Google for building native UIs on Android.

## 3. AI Agents & Services

This stack is for building standalone AI agents or services that require structured data interaction.

-   **Core Framework:** **PydanticAI**
    -   *Reasoning:* Enables building AI applications with structured, type-hinted data models, ensuring reliability and predictability. This is the **mandatory** choice for developing AI agent functionality.