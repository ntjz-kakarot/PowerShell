## PowerShell Scripts

These are random/basic scripts I created or modified from other sources to meet specific customer needs.

### 1. archive-zip-move-delete.ps1
**Description:** One of our customers required a simple solution to compress their archived security logs in the Domain Controllers and send them to a file share folder. Once moved, the event log should be removed from the original location. This script provides that functionality and can be integrated with the Task Scheduler for automation.

### 2. desktopFileMove.ps1
**Description:** During an audit review, a customer organization was advised to enforce an org-wide clean desktop policy. Initially, I tried implementing a GPO to deny write access to users' desktops. However, this approach presented potential long-term problems. As an alternative, I experimented with `cacls/icacls`. While it addressed the issue, I eventually settled on a script I found online. The original script was heavily modified to match the customer's specifications and was implemented as a logon script.

### 3. automated_ODT.ps1
**Description:** Isn't it annoying to install all the bloat from a standard Office ProPlus 2021 license? In that case, this script will come in handy. It will just install Word, Excel and Powerpoint.
