output "vnet_name" {
    value = azurerm_virtual_network.vnet.name
}

output "nic_id" {
    value =azurerm_network_interface.NICpublic.id
  
}

output "publicIp" {
  value = azurerm_public_ip.publicIP.ip_address
}