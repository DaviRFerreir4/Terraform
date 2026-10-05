resource "azurerm_resource_group" "resource_group" {
  name     = "rg-vm"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-terraform"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = local.common_tags
}

resource "azurerm_network_interface" "network_interface" {
  name                = "nic-terraform"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location

  ip_configuration {
    name                          = azurerm_public_ip.public_ip.name
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.ip_address
  }

  tags = local.common_tags
}

resource "azurerm_network_interface_security_group_association" "nisg" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = data.terraform_remote_state.vnet.outputs.security_group_id
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-terraform-nginx"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name

  security_rule {
    name                       = "HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "snsga" {
  subnet_id                 = data.terraform_remote_state.vnet.outputs.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "vm-terraform"
  resource_group_name   = azurerm_resource_group.resource_group.name
  location              = var.location
  size                  = "Standard_B1"
  admin_username        = "terraform"
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  custom_data = base64encode(file("./docs/docker.sh"))
  
  admin_ssh_key {
    username   = "terraform"
    public_key = file("./azure-key.pub")
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = local.common_tags
}