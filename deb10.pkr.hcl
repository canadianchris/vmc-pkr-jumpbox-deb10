source "vsphere-iso" "debian10" {
  vcenter_server        = var.vcenter_fqdn
  username              = var.vcenter_username
  password              = var.vcenter_password
  cluster               = var.vcenter_cluster
  resource_pool         = var.vcenter_resourcepool
  insecure_connection   = true 

  datacenter            = var.vcenter_datacenter
  datastore             = var.vcenter_datastore

  folder                = var.vcenter_folder

  ssh_password          = var.connection_password
  ssh_username          = var.connection_username

  vm_name               = "jumpbox-1"
  CPUs                  = var.num_cpu
  RAM                   = var.vm_ram
  RAM_reserve_all       = true 

  guest_os_type = "debian10_64Guest"

  network_adapters {
    network       = var.vm_network
    network_card  = "vmxnet3"
  }
  
  disk_controller_type = ["pvscsi"]

  storage {
    disk_size             = var.root_disk_size
    disk_thin_provisioned = true
  }

  convert_to_template = true

  boot_command = [
        "<esc><wait>",
        "install <wait>",
        " preseed/url=https://gist.githubusercontent.com/canadianchris/7794b2bcdc010fc7f94bedc53f919654/raw/12b988dceb21c76fb34358c130c789d88573407a/preseed.cfg <wait>",
        "debian-installer=en_US.UTF-8 <wait>",
        "auto <wait>",
        "locale=en_US.UTF-8 <wait>",
        "kbd-chooser/method=us <wait>",
        "keyboard-configuration/xkb-keymap=us <wait>",
        "netcfg/get_hostname={{ .Name }} <wait>",
        "netcfg/get_domain=vagrantup.com <wait>",
        "fb=false <wait>",
        "debconf/frontend=noninteractive <wait>",
        "console-setup/ask_detect=false <wait>",
        "console-keymaps-at/keymap=us <wait>",
        "grub-installer/bootdev=/dev/sda <wait>",
        "<enter><wait>"
  ]

  http_directory = "http"
  iso_url = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.9.0-amd64-netinst.iso"
  iso_checksum = "sha256:8660593d10de0ce7577c9de4dab886ff540bc9843659c8879d8eea0ab224c109"
  shutdown_command = "echo 'tanzu' | sudo -S shutdown -P now"

}

build {
  sources = [
    "source.vsphere-iso.debian10",
  ]
}