<#-----------------------------------------------------------------------------
  Azure Helper Functions

  Author: Robert C. Cain | @ArcaneCode | info@arcanetc.com
          http://arcanecode.me
 
  This module is Copyright (c) 2017 Robert C. Cain. All rights reserved.
  The code herein is for demonstration purposes. No warranty or guarentee
  is implied or expressly granted. 
 
  This code may be used in your projects. 

  This code may NOT be reproduced in whole or in part, in print, video, or
  on the internet, without the express written consent of the author. 
 -----------------------------------------------------------------------------#>

<#-----------------------------------------------------------------------------
  This code was used in a YouTube video, which can be found at:

  http://bit.ly/acredyt01

  in turn, that video demonstrated code for an article I wrote for SimpleTalk,
  which you can find at:

  http://bit.ly/acred01

-----------------------------------------------------------------------------#>



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

# Normal Way
$resourceGroupName = 'NormalWayRG'
New-AzureRmResourceGroup -Name $resourceGroupName `
                         -Location $location

Get-AzureRmResourceGroup | Format-Table

# Our way! Only create the resource group, if needed
$resourceGroupName = 'NewImprovedWayRG'
New-PSResourceGroup $resourceGroupName $location -Verbose

Get-AzureRmResourceGroup | Format-Table

# Clean up after ourselves
$resourceGroupName = 'NormalWayRG'
Remove-AzureRmResourceGroup -Name $resourceGroupName  -Force
$resourceGroupName = 'NewImprovedWayRG'
Remove-AzureRmResourceGroup -Name $resourceGroupName  -Force
Get-AzureRmResourceGroup | Format-Table

