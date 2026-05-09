# Terraform Expert Skill

This skill provides expert guidance for Terraform development, infrastructure mapping, and project-specific patterns. It is designed to be vendor-agnostic and compliant with the Agent Skills open standard.

## 1. Infrastructure Mapping Registry (Living Document)
*   **Altissimo (Core):** Centralized state management is handled in the \`altissimo/altissimo-terraform\` repository.
*   **Everygene:** 
    *   State buckets: \`everygene/gcp\` (\`terraform/storage.tf\`).
    *   App-specific buckets: \`everygene/everygene/terraform/storage.tf\`.
*   **Personal Projects:** Core infrastructure and state buckets are managed in the \`terraform-lukwam\` repository.

## 2. Reference Patterns (The "Good" Way)

### A. Module Sourcing
Prefer registry-based sourcing for core infrastructure to ensure version consistency.
*   **Good Pattern:** \`source = "altissimo-hq/project/google"\` (found in \`everygene/everygene/terraform/project.tf\`)
*   **Local Pattern:** Use local paths only for project-specific sub-components: \`source = "./modules/lb"\`.

### B. Environment-Aware Initialization
For multi-environment projects, use the \`init.sh\` wrapper script and \`env/\` directory.
*   **Reference:** \`src/personal/hex/terraform/init.sh\`
*   **Mechanism:** The script should load backend config from \`env/<env>-backend\` and tfvars from \`env/<env>.tfvars\`.

### C. Provider Versioning
Use bounded ranges for providers to allow for minor updates while preventing breaking changes.
*   **Good Pattern:** (from \`altissimo/altissimo-dev/terraform/main.tf\`)
    \`\`\`hcl
    required_providers {
      google = {
        source  = "hashicorp/google"
        version = ">= 5.36.0, < 6.0"
      }
    }
    \`\`\`

## 3. Anti-Patterns to Avoid (The "Wall of Shame")

### A. Hardcoded Environment Values
**Bad Pattern:** Hardcoding project IDs or regions.
*   *Example:* \`billing_project = "everygene-dev"\` or \`location = "us-east4"\`.
*   *Fix:* Use \`var.project_id\` or \`var.region\`.

### B. Missing Core Blocks
**Bad Pattern:** Omitting \`required_providers\` or \`backend\` configurations entirely.
*   *Example:* Found in \`src/personal/hera/terraform/main.tf\`.
*   *Fix:* Every production-grade repo must explicitly define its provider requirements and remote state.

### C. Inconsistent Hooks
**Bad Pattern:** Running \`terraform_fmt\` but forgetting \`terraform_validate\` or \`terraform_docs\`.
*   *Fix:* Ensure your \`.pre-commit-config.yaml\` matches the standard in \`src/personal/hex/.pre-commit-config.yaml\`.

## 4. Development Workflow
*   **Provider Freshness:** Always attempt to use the newest viable provider versions.
*   **Bug Tracking:** Use the GitHub CLI (\`gh\`) to create issues for bugs in custom modules (repositories in \`~/altissimo/terraform-*\`).
