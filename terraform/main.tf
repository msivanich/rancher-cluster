terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
        }
    }
}

provider "proxmox"{
    pm_api_url = "https://10.0.0.250:8006/api2/json"
    pm_user = ""
    pm_password = ""
    pm_tls_insecure = "true"
}

resource "proxmox_vm_qemu" "rancher-server" {
    count           = 1
    name            = "tf-rancher-server"
    target_node     = "pig-prox"
    clone           = "ubnutu-temp"
    bootdisk        = "scsi0"
    agent           = 1
    sockets         = 1
    cores           = 4
    memory          = 4096
}