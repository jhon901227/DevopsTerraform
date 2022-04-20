variable "rgname" {
  type=string
}
variable "location_name" {
   type=string
}
variable "vnet_name" {
    description = "Represents RG Name"
    type = string
}

variable "vnet_address_space" {
    description = "address_space of the Vnet"
    type = list
}

variable "vnet_tags" {}

variable "subnetName" {
    description = "Nombre subnet"
    type=string
  
}
variable "address_prefixes" {
   type=list
}
variable "Nic_name" {
   type=string
}
variable "nsg_name" {
type = string
  
}
variable "publicIPName" {
  
}
variable "rules" {
type=list

}