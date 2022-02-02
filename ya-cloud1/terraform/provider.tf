terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token = "AQAAAAA79qnSAATuwT0l4kEo-UCesD9-o3hSHuE"
  cloud_id = "b1gbhmljkbnj0readvfb"
  folder_id = "b1gofjhmbooslibeifao"
  zone = "ru-central1-a"
  #service_account_key_file = "key.json"
  #cloud_id  = "${var.yandex_cloud_id}"
  #folder_id = "${var.yandex_folder_id}"
}
