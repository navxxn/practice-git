Connect-AzAccount

Get-AzVM

get-command | Where-Object {$_.Name -ilike "*policy*"}

New-AzPolicyDefinition -Name "first-policy" -scope -Policy "/Users/shady/Documents/Socgen/techademy/azure/policy/policy.json"

$policy_definition = Get-AzPolicyDefinition | Where-Object {$_.Name -eq "first-policy"}
$scope = Get-AzResourceGroup | Where-Object {$_.ResourceGroupName -eq "policy-vm"} | select ResourceId
$subscription = Get-AzSubscription

Write-Output $scope

New-AzPolicyAssignment -Scope $scope -PolicyDefinition $policy_definition

Get-AzResourceProvider | Where-Object {$_.ProviderNamespace -eq "Microsoft.Authorization"}

Get-AzPolicyDefinition

Start-AzPolicyComplianceScan -ResourceGroupName "policy-rg"

New-AzVM -ResourceGroupName "POLICY-VM"

$vm = (get-azvm -name "policy-vm")
$vm.StatusCode

Get-AzVM
Stop-AzVM -name policy-vm