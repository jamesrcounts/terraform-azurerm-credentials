variable "owner_scope" {
  description = "(Optional) A map of friendly names to resource ids that the principal created by this module will have Onwer rights to manage."
  type        = map(string)
}

variable "project" {
  description = "(Required) The project name.  Used to generate the names for the application registration and other objects."
  type        = string
}