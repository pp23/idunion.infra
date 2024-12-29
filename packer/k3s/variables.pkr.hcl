variable "PROJECT" {
  type = string
  description = "Name of the project this image belongs to"
}

variable "TOKEN" {
  type  = string
  description = "HCloud API-Token"
}

variable "VERSION" {
  type  = string
  description = "Unique version which identifies this snapshot in terraform via tags"
}
