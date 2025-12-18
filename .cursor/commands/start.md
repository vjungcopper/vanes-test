# Start Command

This document defines the "start" command workflow. When a user requests to "run start" or simply types "start", execute the following commands simultaneously.

## Overview

Start the backend services and the web-app frontend server concurrently to enable full local development.

## Command Usage

When a user says:

- "run start"

## Commands to Execute

Execute these commands **sequentially**:

1. **Backend Services** (First)

   - Command: `./cc.start`
   - Permissions Required: `all`
   - Run as: Background process
   - **Note:** Ignore intermediate errors/warnings; However see the section `Failures` below
   - **Wait for:** The backend services are up and running without returning to the command prompt. Let the user know that the backend services have been successfully started.
   - **ONLY consider it as a failure when the process exits and returns to the command prompt (terminal shows `$` ready for input)**
   - **DO NOT consider these as failures and take any action:**
     - Intermediate error messages (e.g., "Operation not permitted", permission warnings)
     - Non-fatal exceptions that appear while the process continues running
     - Warning messages that don't stop the process
   - **If any output message contains:**

     - "❌ Failed to start 1 or more services"
     - "please run ./cc.stop and try again"

     Then automatically:

     1. Report the error to the user
     2. Explain that you're going to run the install script to fix the issue
     3. **HALT the start process immediately**
     4. Once halted, run `./cc.install` with permissions `all`

     **During install, handle interactive prompts as follows:**

     - When prompted "Ready to install? (Y/N)" → Answer with `Y`
     - When prompted about resetting database/ElasticSearch (e.g., "If you already have ... please answer 'No' for this step unless you want to reset your database and ElasticSearch. Answer N(no) to skip, or Y(yes) to proceed") → Answer with `N`

     5. Wait for the install to complete
     6. Report the install results to the user
     7. **Do not** automatically retry the start command after install
     8. Ask the user to confirm if they'd like to start again (the **Backend Services** step)

   - **If getting "Missing or invalid credentials"**
     - Let the user know that their Personal access tokens might have been expired, and tell them to go to https://github.com/settings/tokens then create a new token (classic)
     - Ask the user to enter their username
     - Once their username was entered
     - Ask the user to enter their new token
     - Once the token is entered, run `GIT_ASKPASS= GIT_TERMINAL_PROMPT=1 git ls-remote https://github.com/ProsperWorks/ALI.git`
     - When terminal prompts to enter username or password, enter the username then the token the user has given as the password
     - If all processed successfully, ask the user to confirm if they'd like to start again (the **Backend Services** step)

2. **Web App Frontend** (Once the backend services are up and running)

   - Ask the user if they'd like to enable live reloading for web app development
     - If they say "No", move onto the next step.
     - If they say "Yes", start this process:
       - Working Directory: `client/web-app`
       - Command: `ember s`
       - Permissions Required: `all`
       - Run as: Background process
       - **Note:** Ignore intermediate errors/warnings; only fail if process exits without success message
       - **Wait for:** Ember server to be fully ready (serving on port)

3. **Provide a link** (After ember server is ready)
   - Action: Provide a link `https://copper.cool` to open it in their browser
   - **Wait for:** Ember server output indicating it's serving/ready

## Expected Behavior

After running these commands:

- Backend services should be accessible for API requests
- Ember web app should be available at http://localhost:4201
- Both processes will continue running in the background
