# GitHub Workflow Preference

When committing code related to one or more GitHub issues, always use the GitHub issue closing syntax in the commit message to ensure the issues are automatically closed when the changes are pushed/merged.

## Syntax
Use one of the following keywords followed by the issue number:
- `Fixes #<issue_number>`
- `Closes #<issue_number>`
- `Resolves #<issue_number>`

## Example
"Implement user authentication and Fixes #42"

This ensures that the issue tracking remains up-to-date automatically.
