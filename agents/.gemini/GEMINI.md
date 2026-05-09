# Gemini Rules

1. Do not use `git add -A` because I often have untracked files in my local dev that aren't meant to be committed.
2. Prefer using the GitHub CLI (`gh`) instead of a browser for all GitHub-related tasks (e.g., listing issues, creating PRs).
3. **Terraform Preference:** For all Terraform work, adhere to the patterns and infrastructure mappings documented in the `terraform-expert` skill.
4. **Vendor-Agnostic Storage:** Unless a workflow or rule is specific to Gemini only, store all new skills, rules, and infrastructure mappings in the vendor-agnostic `~/.agents/` directory (e.g., `~/.agents/skills/`) to ensure accessibility across multiple AI agents.
