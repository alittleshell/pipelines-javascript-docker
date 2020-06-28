$VmssResourceGroupName='TestProxy'
$VmssName="TestProxyService"
$VaultName='KeyVault-PSP'
$KeyVaultResourceGroupName ='ResourceGroup-PSP'
$certName= "PrivateServiceCert"
# get vmss info
$vmss = Get-AzVmss -ResourceGroupName $VmssResourceGroupName -VMScaleSetName $VmssName
# set cert config

$keyVault = Get-AzKeyVault -VaultName $VaultName -ResourceGroupName $KeyVaultResourceGroupName
$SourceVault = $keyVault.ResourceId

$KVSecret=Get-AzKeyVaultCertificate  -VaultName $VaultName -Name $certName
$CertificateURL = $KVSecret.SecretId 


$certConfig = New-AzVmssVaultCertificateConfig -CertificateUrl $CertificateURL -CertificateStore "My"
$certConfig
