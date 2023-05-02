terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 0.13"
}

provider "twc" {
  token = var.TOKEN
}

data "twc_os" "ansible-os" {
  name = "debian"
  version = "11"
}

data "twc_configurator" "ansible-configurator" {
  location = "ru-1"
  disk_type = "nvme"
}

resource "twc_server" "ansible-server" {
  name = "Ansible server"
  os_id = data.twc_os.ansible-os.id

  configuration {
    configurator_id = data.twc_configurator.ansible-configurator.id
    disk = 1024 * 10
    cpu = 2
    ram = 4096
  }
}