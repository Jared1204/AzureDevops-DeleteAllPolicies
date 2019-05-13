# VSTS Settings
$Organization = "{Azure Devops Organization}"
$Project = "{Azure Devops Project}"

$user = "{Service Account Email"
$token = "{Service Account Token (Requires Scope: Code(Read & Write))}"

# Get all policies in the project
$url = "https://dev.azure.com/$Organization/$Project/_apis/policy/configurations?api-version=5.0"
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user,$token)))

$GetAllPoliciesResult = Invoke-RestMethod -Uri $url -Method GET -ContentType "application/json" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)}

Write-Host "Preparing to delete $($GetAllPoliciesResult.Count) Policies from $Project Press any key to continue"

Read-Host

foreach($child in $GetAllPoliciesResult.value)
{
    Write-host "Deleting Policy" $child.id -ForegroundColor red

    $url = "https://dev.azure.com/$Organization/$Project/_apis/policy/configurations/$($child.id)?api-version=5.0"
    
    # Uncomment this once you are sure you DO NOT need the policies in the following project (There is NO going back)
    # Invoke-RestMethod -Uri $url -Method Delete -ContentType "application/json" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)}
}