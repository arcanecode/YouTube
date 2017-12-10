$dir = "$($env:OneDrive)\Pluralsight\Azure\demos\course-01"
Set-Location $dir

# Run a script with functions used by multiple scripts in this course
. .\module-common.ps1

# Login if we need to
Connect-PSToAzure $dir -Verbose

# Select the Azure account to use ---------------------------------------------
# You can use a framework such as this if you have multiple accounts
# PS=Pluralsight VS=Visual Studio MSDN FT=Azure Free Trial AC=ArcaneCode
$accountToUse = 'FT'
. .\module-set-common-vars.ps1 -AccountToUse $accountToUse
$location = 'southcentralus'

# Set the session to use the correct subscription
Set-PSSubscription $useSub

# Get a list of exisiting RG's
Clear-Host
Get-AzureRmResourceGroup | Format-Table

# Set name of RG to Create
$resourceGroupName = 'SomeTestRG'

# Normal Way
New-AzureRmResourceGroup -Name $resourceGroupName `
                         -Location $location


# Our way! Only create the resource group, if needed
New-PSResourceGroup $resourceGroupName $location -Verbose

Get-AzureRmResourceGroup | Format-Table

# Clean up after ourselves
Remove-AzureRmResourceGroup -Name $resourceGroupName  -Force
Get-AzureRmResourceGroup | Format-Table

