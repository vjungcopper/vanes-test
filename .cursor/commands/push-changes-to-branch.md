## Command Usage

When a user says:

- "run push"

Execute commands with proper permissions.

### run push

Pushes changes to the current branch with proper git workflow: checks for changes, stages, commits, and pushes with upstream handling.

**Steps:**

1. Check current branch status:

   - Run `git branch --show-current` to confirm which branch you're on
   - Display the current branch name to the user

2. Check for changes:

   - Run `git status --porcelain` to check for uncommitted changes
   - If no changes are detected:
     - Inform user "No changes to commit"
     - Check if there are unpushed commits with `git log @{u}..HEAD`
     - If unpushed commits exist, ask if they want to push anyway
     - If no unpushed commits, end the command

3. If there are uncommitted changes:

   - Display the changes with `git status` for user review
   - Ask user for a commit message
   - Run `git add .` to stage all changes
   - Run `git commit -m "[user's commit message]"`
   - Confirm the commit was successful

4. Push to remote:

   - Run `git push`
   - If the push fails with upstream error (typically "no upstream branch"):
     - The error message will suggest: `git push --set-upstream origin [branch-name]`
     - Automatically extract the branch name from the error or use the current branch
     - Run `git push --set-upstream origin [branch-name]`
     - Confirm successful push

5. Verify push was successful:
   - Run `git status` to confirm branch is up to date with remote
   - Display success message to user

**Important notes:**

- Always display the current branch before pushing to avoid mistakes
- Commit messages are required and should be descriptive
- The first push on a new branch requires setting upstream
- If conflicts occur during push, inform user to pull first with `git pull --rebase`
- Always confirm each step completed successfully before proceeding
- When pushing:
  - **Permissions Required:** `all` - Git push requires full system access to authenticate with GitHub (access to macOS Keychain, SSH agents, and credential helpers)
