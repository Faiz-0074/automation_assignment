
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    Project        = "Automation Project – Assignment 1"
    Name           = "faiz.radhanpuri"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}
variable "linux_os" {
  description = "The name of the Linux virtual machine"
  default     = "n01585456-u-vm"
}




variable "resource_group_name" {
  type    = string
  default = "N01585456-assignment1-RG"
}

variable "location" {
	default = "eastus" 
}


variable "vnet_name" {
  type    = string
  default = "5456vnet"
}

variable "subnet_name" {
  type    = string
  default = "5456subnet"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "vm_count" {
  type    = number
  default = 2
}

variable "dns_label_prefix" {
  type    = string
  default = "5456"
}

variable "ssh_user" {
  type    = string
  default = "centos"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "subnet_id" {
  type = string
}

variable "storage_account_uri" {
}
