# Poetry Expert Skill

This skill provides expert guidance for Poetry version 2.0 development. It enforces v2-specific syntax and development practices.

## 1. Poetry Version & Enforcement
*   **Version:** Always assume Poetry **2.0 or higher**.
*   **Validation:** If unsure, run `poetry --version`.

## 2. Reference Patterns (The "Good" Way)

### A. Environment Synchronization
Use `poetry sync` to synchronize the environment with the lock file.
*   **Good Pattern:** `poetry sync`
*   **Deprecated Pattern:** `poetry install --sync` (Poetry 1 only)

### B. Command Execution
Always use `poetry run` for executing commands within the project's virtual environment.
*   **Good Pattern:** `poetry run ruff check .`
*   **Bad Pattern:** `.venv/bin/ruff check .`

### C. Script Execution
For temporary or administrative scripts, always use `poetry run python <path>`.
*   **Good Pattern:** `poetry run python scripts/my_script.py`
*   **Anti-Pattern:** Using system python or activating the venv manually.

### D. Dependency Management
Use dependency groups for non-main dependencies.
*   **Good Pattern:** `poetry add <package> --group dev`
*   **Good Pattern:** `poetry install --without dev`
*   **Deprecated Pattern:** `poetry add <package> --dev`
*   **Deprecated Pattern:** `poetry install --no-dev`

### E. Locking Behavior
Be aware that `poetry lock` no longer updates dependencies by default.
*   **Refresh Lock (No Update):** `poetry lock`
*   **Update Dependencies:** `poetry lock --regenerate` or `poetry update`

### F. Environment Activation
`poetry shell` is removed in v2.
*   **Activation:** Use `poetry env activate` to get the activation command.

## 3. Monorepo & Plugin Awareness
*   **Plugins:** Some projects (like `everygene`) may use `poetry-monoranger-plugin` or `poetry-plugin-export`.
*   **Exports:** `poetry export` is now a plugin and might not be available by default. Check if `poetry-plugin-export` is installed before using.

## 4. Anti-Patterns to Avoid
*   **Direct Path Execution:** Never bypass `poetry run` by calling binaries in `.venv/bin/` directly.
*   **Poetry 1 Flags:** Avoid `--dev`, `--no-dev`, and `--sync` (as a flag for `install`).
*   **Mocking Secrets:** Avoid manual environment variable mocking in scripts; prefer loading real `.env` files via project-specific loaders (e.g., `setup_env.init()`) when available.
*   **PEP 621 Neglect:** Prefer the `[project]` section in `pyproject.toml` for standard metadata if the project uses PEP 621.
