#Configure virtual network


resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location_name
  resource_group_name = var.rgname
  tags                = var.vnet_tags
}
resource "azurerm_subnet" "azsubnet" {
  name                 = var.subnetName
  resource_group_name  = var.rgname
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
}


resource "azurerm_network_interface" "NICpublic" {
  name                = var.Nic_name
  location            = var.location_name
  resource_group_name = var.rgname
  

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.azsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicIP.id
  }
}


resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location_name
  resource_group_name = var.rgname

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsgassociation" {
  subnet_id                 = azurerm_subnet.azsubnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_public_ip" "publicIP" {
  name                = var.publicIPName
  resource_group_name = var.rgname
  location            = var.location_name
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}