name = "RG-TerraformLab07"
location = "westeurope"
tags = {
    "Environment" = "Development"
    "Owner" = "John"
}
vnet_name = "Vnet-VirtualMachine"
vnet_address_space = ["10.0.0.0/16"]
vnet_tags = {
    "Environment" = "Development"
    "Owner" = "John"    
}
subnetName="SubnetVirtualMachine"
address_prefixes= ["10.0.2.0/24"]
Nic_name="PublicNic"
nsg_name="nsgvm"
vm_name="LinuxOracle7"
publicIPName="publicIP"
sizevm="Standard_D2s_v3"
publisher="Canonical"
offer="UbuntuServer"
sku="18.04-LTS"
versionvm="latest"
rules=["22","80","8080"]
priority=["100","200","300"]