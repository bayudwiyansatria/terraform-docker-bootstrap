variable "server_ips" {
  type        = list(string)
  description = "Server IPs"
}

variable "ssh_private_key" {
  type        = string
  description = "SSH Private Key"
}

#-----------------------------------------------------------------------------------------------------------------------
# Docker
#-----------------------------------------------------------------------------------------------------------------------
variable "docker_version" {
  type        = string
  description = "Docker Version"
  default     = "20.10.11"
}