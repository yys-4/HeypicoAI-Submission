variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-southeast-1" # Contoh: Singapura. Kita bisa ganti.
}

variable "project_name" {
  description = "A name prefix for all created resources."
  type        = string
  default     = "heypico-webapp"
}