Connect-AzAccount

$List_vm = Read-Host "Do you wish to list all the VMs [y/n]"

if($List_vm -eq "y"){
    Get-AzVM
}

$VM_name = Read-Host "Enter the VM name to remove"
Stop-AzVM -name $VM_name
Remove-AzVM -name $VM_name