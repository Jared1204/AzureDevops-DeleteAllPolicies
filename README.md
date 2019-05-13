# AzureDevops-DeleteAllPolicies
Deletes all branch policies in a given azure devops project

## How to use

- Enter Organization
- Enter Project you wish to remove all policies from
- Enter the email address of a service account or you're own account
- Generate a PAT against that acount with Scope: Code(Read & Write)

You will be asked to push any key once all policies in the project have been found, once you are ready, uncomment line 25 and run it again.

This **cannot** be undone, be very very sure you have the right project selected.
