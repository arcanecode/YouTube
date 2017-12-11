param( [string]$AccountToUse )

<#-----------------------------------------------------------------------------
  Set variables used in multiple scripts

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
   Based upon the value passed in the $AccountToUse variable, the switch     
   statement will set a number of variables. the key is the $useSub, which   
   will later indicate which Azure Subscription we want to use.              
                                                                             
   The selection of two characters for the $AccountToUse variable was        
   arbitrary, you can make this string whatever you want.                    
-----------------------------------------------------------------------------#>

switch ($accountToUse)
{
  'AC' {
         $useSub = 'Azure Free Trial'
         $resourceGroupName = 'ArcaneFTDemo'
         $storageAccountName = 'arcaneftstoragedemo'
         $containerName = 'arcaneftstoragecontainer'
         $serverName = 'arcaneftsqlserver'
         break
       }
  'PS' { 
         $useSub = 'Pluralsight Azure Content'
         $resourceGroupName = 'PSAZDemo'
         $storageAccountName = 'psazstoragedemo'
         $containerName = 'psazstoragecontainer'
         $serverName = 'psazsqlserver'
         break
       }
  'VS' { 
         $useSub = 'Visual Studio Ultimate with MSDN'
         $resourceGroupName = 'PSDemo'
         $storageAccountName = 'psstoragedemo'
         $containerName = 'psstoragecontainer'
         $serverName = 'pssqlserver'
         break
       }
  'FT' {
         $useSub = 'Azure Free Trial'
         $resourceGroupName = 'PSFTDemo'
         $storageAccountName = 'psftstoragedemo'
         $containerName = 'psftstoragecontainer'
         $serverName = 'psftsqlserver'
         break
       }
  default      
       { 
         $useSub = 'Visual Studio Ultimate with MSDN'
         $resourceGroupName = 'PSDemo'
         $storageAccountName = 'psstoragedemo'
         $containerName = 'psstoragecontainer'
         $serverName = 'pssqlserver'
         break
       }
}
