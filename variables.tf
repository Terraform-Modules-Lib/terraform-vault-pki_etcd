variable "name" {
  type = string
}

variable "path_prefix" {
  type = string
  default = ""
}

variable "parent_authority_path" {
  type = string
  default = ""
}

variable "urls_prefix" {
  type = set(string)
  default = []
}
