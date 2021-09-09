terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = "ru-central1-a"
}

resource "yandex_mdb_clickhouse_cluster" "dbt" {
  name        = "clickhouse-dwh"
  environment = "PRODUCTION"
  network_id  = "${yandex_vpc_network.dbt.id}"

  clickhouse {
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 100
    }
  }

  database {
    name = "dbt"
  }

  user {
    name     = "dbt"
    password = var.clickhouse_password
    permission {
      database_name = "dbt"
    }
  }

  host {
    type      = "CLICKHOUSE"
    zone      = "ru-central1-a"
    subnet_id = "${yandex_vpc_subnet.dbt.id}"
    assign_public_ip = true
  }
}

resource "yandex_vpc_network" "dbt" {}

resource "yandex_vpc_subnet" "dbt" {
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.dbt.id}"
  v4_cidr_blocks = ["10.5.0.0/24"]
}
