# Stop Command

This document defines the "stop" command workflow. When a user requests to "run stop" or simply types "stop", execute the following commands sequentially to gracefully shut down the development environment.

## Overview

Stop the web-app frontend server first, then stop the backend services to ensure a clean shutdown.

## Command Usage

When a user says:

- "run stop"

Execute the stop sequence to gracefully shut down both frontend and backend services.

## Commands to Execute

Execute these commands **sequentially**:

1. **Stop Web App Frontend** (First)

   a. **Check for running process on port 4201:**

   - Command: `lsof -i :4201`
   - Permissions Required: `all`
   - Purpose: Identify if Ember server is running and get its PID

   b. **Kill the process if running:**

   - Command: `kill -9 $(lsof -ti :4201)`
   - Permissions Required: `all`
   - Only execute if lsof found a running process

   c. **Verify process is stopped:**

   - Command: `lsof -i :4201`
   - Expected: No output (confirming port 4201 is free)
   - **Wait for:** Confirmation that no process is listening on port 4201

2. **Stop Backend Services** (After frontend is stopped)
   - Command: `./cc.stop`
   - Permissions Required: `network`
   - Run as: Background process
   - **Wait for:** Output containing "All containers stopped successfully."

## Execution Notes

- First, check if the Ember server is running on port 4201 using lsof
- If a process is found, forcefully kill it using kill -9
- Verify that port 4201 is free before proceeding
- Once frontend is confirmed stopped, run the backend stop script
- The cc.stop script will handle stopping all backend services gracefully

## Expected Behavior

After running these commands:

- Ember web app server will be stopped (port 4201 freed)
- All backend services will be stopped
- Development environment will be fully shut down

## Error Handling

**CRITICAL: Do not automatically retry or run other commands on failure.**

If any step fails:

1. Report the error to the user
2. Show the error output
3. STOP execution - do not proceed to the next step
4. Wait for the user to manually address the issue

The user must explicitly request to retry or run other commands.
