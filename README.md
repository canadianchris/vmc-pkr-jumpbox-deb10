# VMware Cloud - Packer Debian Jumpbox Deployment

This is a short and sweet deployment of a Debian 10 jumpbox or bastion host. It sends the Debian 10.9 netist ISO to VMC, checks the SHA256 sum, creates a virtual machine, attaches the ISO and the preseed.cfg answers all of the questions to have a basic install of Debian including ssh server, open-vm-tools. 

The main work gets done in the vsphere-iso builder, this is found in the deb10.pkr.hcl file. 

Variables are configured in variables.prk.hcl, and definition of the variables should be set in the vsphere.auto.pkrvars.hcl file. Copy the vsphere.auto.pkrvars.hcl.templ to vsphere.auto.pkrvars.hcl.

Note in the boot_command = [] section, I am pointing to a public gist to get the preseed.cfg for the automated install. 

If you are in an environment where the jumpbox will be able to talk to the system running packer, this configuration will serve preseed.cfg over http. You'll need to update the preseed/url in boot_command to point to the local IP. 

## TODOS
* Start using issues :)
* automate creation of public IP, NAT to host on CGW
* find a better way to manage the preseed 

