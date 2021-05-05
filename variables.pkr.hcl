variable "vcenter_fqdn" {
    description = "vCenter server to build the VM on"
}
variable "vcenter_username" {
    description = "Username to authenticate to vCenter"
}
variable "vcenter_password" {
    description = "Password to authenticate to vCenter"
    default     = ""
}
variable "vcenter_cluster" {}
variable "vcenter_datacenter" {}
variable "vcenter_datastore" {}
variable "vcenter_resourcepool" {}
variable "vcenter_folder" {
    description = "The vcenter folder to store the template"
}
variable "connection_username" {
    default = "tanzu"
}
variable "connection_password" {
    default = "tanzu"
}
variable "root_disk_size" {
    default = 48000
}
variable "vm_network" { }
variable "num_cpu" {
    default = 4
}
variable "vm_ram" {
    default = 4096
}