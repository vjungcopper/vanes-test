## Command Usage

When a user says:

- "run new branch"

Execute commands with proper permissions.

### run create new branch

Creates a new git branch following best practices: saves current work, updates main, and creates a fresh branch.

**Steps:**

1. Check current branch status by running `git branch`

2. If you are on a feature branch (NOT on main):

   - Check for uncommitted changes with `git status`
   - If there are uncommitted changes:
     - Ask user for a commit message
     - Run `git add .` to stage all changes
     - Run `git commit -m "[commit message]"` to commit
   - Run `git fetch` to update remote references
   - Check if the branch exists on remote with `git ls-remote --heads origin [branch-name]`
   - If branch exists on remote and has unpushed commits:
     - Ask user if they want to push
     - If yes, run `git push`

3. Switch to main branch with `git checkout main`

4. Check if main is up to date:

   - Run `git fetch`
   - Compare local and remote refs
   - If main is behind remote, run `git pull` to update

5. Create new branch:

   - Ask user for the new branch
     - If user enters the new branch name with spacing, automatically fill the spacing with "-" (hyphens) in the name to pass the ref format requirement.
   - Run `git checkout -b [new-branch-name]`

6. Verify the branch was created:
   - Run `git branch` to show all branches
   - Confirm the current branch with `git branch --show-current`

**Important notes:**

- Always check for uncommitted changes before switching branches
- Always update main before creating a new branch from it
- Validate that the branch name is not empty and doesn't already exist
- Provide clear feedback at each step
- When pushing:
  - **Permissions Required:** `all` - Git push requires full system access to authenticate with GitHub (access to macOS Keychain, SSH agents, and credential helpers)
