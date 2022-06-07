# variable "" {
#   type        = ""
#   description = ""
#   default     = ""
# }

variable "github_token" {
  type        = string
  description = "GitHub api token"
}

variable "github_owner" {
  type        = string
  description = "GitHub organization to use"
}

variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "org_id" {
  description = "The GCP organization ID"
  type        = string
}

variable "billing_account_id" {
  description = "The billing account ID to associate with the project."
  type        = string
}

variable "prefix" {
  type        = string
  description = "Prefix applied to service account names."
  default     = ""
}

############################ CIRCIECI VARS ################

variable "circelci_vcs" {
  type        = string
  description = "Circleci VCS either github or bitbucket"
}

variable "circleci_org" {
  type        = string
  description = "Name of the Github Org used in CircleCI"
}

variable "circleci_context" {
  type        = string
  description = "Name ofd the CircleCI context to use"
}

variable "circleci_context_secret_name" {
  type        = string
  description = "Name of the secret to create in the CircleCI context"
}
