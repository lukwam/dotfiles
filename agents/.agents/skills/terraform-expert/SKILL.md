# Terraform Expert Skill

This skill provides expert guidance for Terraform development, infrastructure mapping, and project-specific patterns. It is designed to be vendor-agnostic and compliant with the Agent Skills open standard.

## 1. Infrastructure Mapping Registry (Living Document)
This section maps project groups to their core infrastructure (e.g., state buckets).
**Rule:** When a new project-to-infrastructure mapping is discovered, it MUST be documented here.

*   **Altissimo (Core):** Centralized state management is handled in the `altissimo/altissimo-terraform` repository.
*   **Altissimo (Apps):** Application-specific resources should follow the patterns in `altissimo/python-project-template`.
*   **Everygene:** 
    *   State buckets: Look in `everygene/gcp` (`terraform/storage.tf`).
    *   App-specific buckets: See `everygene/everygene/terraform/storage.tf`.
*   **Personal Projects:** Core infrastructure and state buckets are typically managed in the `terraform-lukwam` repository.

## 2. Core Development Guidelines
*   **Module Usage:** 
    *   Prioritize using custom modules located in the `~/altissimo/terraform-*` repositories.
    *   **Registry Transition:** Prefer registry-based sourcing from `altissimo-hq/` over local paths where available.
*   **Provider Freshness:** Always attempt to use the newest viable provider versions.
*   **Bug Tracking:** When issues occur with custom modules (bugs, missing features, provider updates), use the GitHub CLI (`gh`) to create issues so other agents can address them later.
*   **Pre-commit & Formatting:**
    *   Most Terraform projects must include `terraform-docs`, `terraform fmt`, and **`terraform_validate`** in their `.pre-commit-config.yaml`.
    *   If Terraform configs are in a `terraform/` subdirectory, the documentation generation should be scoped to that directory.

## 3. Environment & State Management
*   **Multi-Environment Patterns:** For projects with multiple environments (e.g., dev, qa, prod), utilize the `init.sh` script and `env/` directory structure for backend configurations. 
    *   **Reference Examples:** See `altissimo/python-project-template` or `everygene/everygene` for the standard wrapper script implementation.
*   **Single-Environment:** Projects with only one environment may omit the `init.sh` / `env/` pattern.

## 4. Anti-Patterns to Avoid
*   **Version Drift:** Avoid using mismatched versions of core modules (e.g., standardized on the latest `altissimo-hq/project/google` releases).
*   **Hardcoding:** Never hardcode project IDs (e.g., `altissimo-dev`) or regions (e.g., `us-east-1`, `us-central1`); use variables or locals.
*   **Missing Hooks:** Ensure `terraform_validate` is not omitted from pre-commit configs even if `fmt` is present.
*   **Resource Looping:** Prefer `for_each` over `count` when creating multiple resources to avoid state shuffling.
*   **Backend:** Always ensure a remote backend is configured (except for local sandboxes).
