# Pre-commit Expert Skill

This skill provides expert guidance for standardizing and maintaining pre-commit configurations across the workspace. It ensures consistent linting, formatting, and validation standards.

## 1. Reference "Gold Standards"
When looking for the ideal implementation, refer to these repositories:
*   **Everygene:** `~/src/everygene/everygene/.pre-commit-config.yaml` (Modern Python/Ruff/Terraform/Jinja stack).
*   **Lived:** `~/src/lived/.pre-commit-config.yaml` (Robust cross-project standards).

## 2. Recommended "Best in Class" Hooks

### A. Generic / Core Formatting
Every project should include these basic validations:
*   **Repo:** `https://github.com/pre-commit/pre-commit-hooks`
    *   `trailing-whitespace`: Trims trailing whitespace.
    *   `end-of-file-fixer`: Ensures files end with a newline.
    *   `check-yaml`: Validates YAML syntax.
    *   `check-added-large-files`: Prevents committing huge files.
    *   `mixed-line-ending`: Forces consistent line endings (prefer LF).

### B. Python (Consolidated)
Prefer `ruff` over fragmented tools like `flake8`, `isort`, or `black`.
*   **Repo:** `https://github.com/astral-sh/ruff-pre-commit`
    *   `ruff`: For linting (include `--fix` in args).
    *   `ruff-format`: For formatting.

### C. Terraform (Comprehensive)
*   **Repo:** `https://github.com/antonbabenko/pre-commit-terraform`
    *   `terraform_fmt`: Standard formatting.
    *   `terraform_validate`: Validates configuration.
    *   `terraform_docs`: Auto-generates documentation (standardize on README.md generation).

### D. Jinja / HTML
*   **Repo:** `https://github.com/djlint/djLint`
    *   `djlint-reformat-jinja`: Formats Jinja templates.
    *   `djlint-jinja`: Lints Jinja templates.

### E. Markdown
*   **Repo:** `https://github.com/igorshubovych/markdownlint-cli`
    *   `markdownlint`: Lints Markdown files.
    *   **Note:** Use a local `.markdownlint.json` for configuration.

### F. Shell Scripts
*   **Repo:** `https://github.com/shellcheck-py/shellcheck-py`
    *   `shellcheck`: Validates shell scripts.

### G. Web / Multi-format
*   **Repo:** `https://github.com/pre-commit/mirrors-prettier`
    *   `prettier`: Use for JSON, CSS, and potentially YAML/Markdown if preferred over specific linters.

## 3. Maturity Levels
When auditing or updating a repository, aim for these levels:
*   **Level 1 (Core):** Basic formatting (trailing-whitespace, check-yaml).
*   **Level 2 (Language):** Essential linters for the primary language (e.g., ruff for Python, fmt for Terraform).
*   **Level 3 (Advanced):** Specialized tools like `djlint`, `markdownlint`, and auto-docs.

## 4. Anti-Patterns to Avoid
*   **Obsolescence:** Using pre-2022 versions of common hooks.
*   **Insecure Protocols:** Using `git://` instead of `https://` in repo URLs.
*   **Fragmentation:** Mixing multiple Python linters when `ruff` is available.
*   **Inconsistency:** Running formatting but skipping validation (e.g., omitting `terraform_validate`).
*   **Silent Failures:** Using massive `exclude` lists that skip core project directories.

## 5. Agent Instructions
When asked to "fix" or "setup" pre-commit:
1. Identify the project's tech stack (Python, Terraform, etc.).
2. Compare the existing `.pre-commit-config.yaml` against the recommended hooks above.
3. Suggest a consolidated update that moves the project toward "Level 3" maturity.
4. Ensure all hook versions are updated to their latest stable releases (refer to Gold Standards for known-good versions).
