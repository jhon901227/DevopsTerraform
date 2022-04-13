  resource "tls_private_key" "privatekey_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
  }

resource "azurerm_linux_virtual_machine" "LinuxOracle7" {
  
  name                = var.vm_name
  resource_group_name = var.rgname
  location            = var.location_name
  size                = var.sizevm
  admin_username      = "adminuser"
  network_interface_ids = [
    var.nic_id,
  ]



  
  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.privatekey_ssh.public_key_openssh
  }


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.versionvm
  }
}