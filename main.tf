#integrating with devops
module "resource_group" {
  source   = "./modules/base"
  name     = var.name
  location = var.location
  tags     = var.tags
}
module "network" {
  source             = "./modules/networking"
  rgname             = module.resource_group.resource_group_name
  location_name      = module.resource_group.resource_group_location
  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space
  vnet_tags          = var.vnet_tags
  subnetName         = var.subnetName
  address_prefixes   = var.address_prefixes
  Nic_name           = var.Nic_name
  nsg_name           = var.nsg_name
  publicIPName       = var.publicIPName
}

module "virtualMachine" {
  source        = "./modules/virtual_machine"
  vm_name       = var.vm_name
  rgname        = module.resource_group.resource_group_name
  location_name = module.resource_group.resource_group_location
  sizevm        = var.sizevm
  nic_id        = module.network.nic_id
  depends_on    = [module.network]
  publisher     = var.publisher
  offer         = var.offer
  sku           = var.sku
  versionvm       = var.versionvm

}

output "publickey"{
  value=module.virtualMachine.tls_private_key
  sensitive = true
}

output "publicIp"{
  value=module.network.publicIp
}