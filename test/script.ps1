# get-azvm | select  HardwareProfile -ExpandProperty HardwareProfile | select HardwareProfile -ExpandProperty HardwareProfile

# Get-AzVM | Where-Object {$_.HardwareProfile.VmSize -like '*DS*'} | Select-Object -Property Name, @{ name = 'Vm size'; Expression = {$_.HardwareProfile.VmSize}}, @{ name = 'Vm OS'; Expression = {$_.StorageProfile.OsDisk.OsType}}

# Get-AzVM | Select-Object Name, Location, StatusCode | Export-Csv -Path '/Users/shady/Documents/Socgen/techademy/azure/azurevm.csv'

#/////////////////////////////////
$storageaccount = Get-AzStorageAccount | Where-Object { $_.ResourceGroupName -like '*shady*'}
$context = $storageaccount.Context

# New-AzStorageContainer -Name 'test' -context $context -Permission Blob

# Remove-AzStorageContainer -Name 'test' -Context $context
# Get-AzStorageContainer -context $context

# New-AzStorageContainer -Name 'mycontainer' -context $context -Permission Container
#////////////////////////////////////////////

#upload a single file
# Set-AzStorageBlobContent -File '/Users/shady/Documents/Socgen/techademy/azure/azurevm.csv' -Container 'mycontainer' -Context $context


#upload multiple files
Get-ChildItem -Path '/Users/shady/Documents/Socgen/techademy/azure/' | Set-AzStorageBlobContent -Container "mycontainer" -Context $context 