variable "yandex_token" {
  type        = string
  description = "Security token or IAM token used for authentication in Yandex.Cloud"
}

variable "yandex_cloud_id" {
  type        = string
  default     = "b1g82ibnk32618vg7an7"
  description = "The ID of the cloud to apply any resources to"
}

variable "yandex_folder_id" {
  type        = string
  default     = "b1gek1i0994h7722sho8"
  description = "The ID of the folder to operate under"
}

variable "clickhouse_password" {
  type        = string
  description = "Set up ClickHouse password"
}
