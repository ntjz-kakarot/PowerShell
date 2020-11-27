# PowerShell

Random/basic scripts I created or modified from another source to meet our customer needs

1. archive-zip-move-delete.ps1

*One of our customers required a simple solution to compress their archived security logs in the Domain Controllers and send them to a file share folder. Once moved, the event log should be removed from the original location. Can be integrated with the Task Scheduler to automate the process.*

2. desktopFileMove.ps1

*In an audit review, a customer organization was asked to have an org-wide clean desktop policy. At first, I tired to implement a GPO that would deny write access to the desktop for users, but this was bound to be problematic in the long run. Then tried cacls/icacls. Eventhough that addressed the issue, I ended up with this script that I found on a website. The original script has been heavily modified to match the customer's need. This was implemented as a logon script*
