terraform {
  required_version = "~> 1.1.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    region     = "ru-central1"
    key        = "s3/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = var.auth_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}

# Create VPC network
resource "yandex_vpc_network" "lab_net" {
  name = "lab-network"
}

# Create VPC subnet-1
resource "yandex_vpc_subnet" "lab_subnet_a" {
  v4_cidr_blocks = ["192.168.10.0/28"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.lab_net.id
  name           = "lab-subnet-a"
}

# Create VPC subnet-2
resource "yandex_vpc_subnet" "lab_subnet_b" {
  v4_cidr_blocks = ["192.168.11.0/28"]
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.lab_net.id
  name           = "lab-subnet-b"
}

# Create lemp instance
module "ya_instance_1" {
  source                = "./modules/instance"
  instance_family_image = "lemp"
  vpc_subnet_id         = yandex_vpc_subnet.lab_subnet_a.id
  instance_zone         = "ru-central1-a"
}

# Create lamp instance
module "ya_instance_2" {
  source        = "./modules/instance"
  vpc_subnet_id = yandex_vpc_subnet.lab_subnet_b.id
  instance_zone = "ru-central1-b"
}

# Create target group
resource "yandex_lb_target_group" "tg" {
  name = "lb-group"

  target {
    subnet_id = yandex_vpc_subnet.lab_subnet_a.id
    address   = module.ya_instance_1.internal_ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.lab_subnet_b.id
    address   = module.ya_instance_2.internal_ip_address
  }
}

# Create network load balancer 
resource "yandex_lb_network_load_balancer" "lb" {
  name      = "network-load-balancer"
  region_id = "ru-central1"

  listener {
    name = "listener"
    port = 80
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.tg.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
      }
    }
  }
}
