module "project-factory-sa" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "4.1.1"

  project_id         = var.project_id
  prefix             = var.prefix
  billing_account_id = var.billing_account_id
  grant_billing_role = true
  grant_xpn_roles    = true

  generate_keys = true

  names        = ["project-factory"]
  display_name = "project factory service account"
  description  = "project factory service account for project factory"

  project_roles = [
    "${var.project_id}=>roles/viewer",
    "${var.project_id}=>roles/iam.serviceAccountAdmin",
    "${var.project_id}=>roles/compute.networkAdmin",
    "${var.project_id}=>roles/compute.xpnAdmin",
    "${var.project_id}=>roles/resourcemanager.folderCreator",
    "${var.project_id}=>roles/resourcemanager.organizationViewer",
    "${var.project_id}=>roles/resourcemanager.projectCreator",
    "${var.project_id}=>roles/billing.viewer",
    "${var.project_id}=>roles/billing.user",
  ]
}

resource "github_actions_organization_secret" "gcp_project_factory_key_secret" {
  secret_name     = "gcp_project_factory"
  visibility      = "private"
  encrypted_value = base64encode(module.project-factory-sa.key)
}

# For debugging and verifying the key matched the secrets in GH & CircleCI
# resource "null_resource" "key" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }
#   provisioner "local-exec" {
#     command = "printf ${base64encode(module.project-factory-sa.key)} | base64 --decode > key.json"
#   }
# }

# Worth testing CircelCI orb for GCP works with this
resource "null_resource" "circleci_context_secret" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    # NOTE 1 - See https://support.circleci.com/hc/en-us/articles/360003540393-How-to-insert-files-as-environment-variables-with-Base64
    # echo "$test1" | base64 --decode > file.file
    # NOTE 2 - Yes we need to base64 encode the key output from the module first so that printf can process/render it properly
    # Then pipe it to base64 decode and THEN pipe it to circleci cli as the value.
    # A bit hacky but removing base64encode will break Terraform running, no base64 decode and your CircleCI context value will be a useless string
    # Could use some orb or logic in circle to decode it but thats just as hacky so trying to keep all the tricky stuff in one place.
    command = "printf ${base64encode(module.project-factory-sa.key)} | base64 --decode | circleci context store-secret ${var.circelci_vcs} ${var.circleci_org} ${var.circleci_context} ${var.circleci_context_secret_name}"
  }
}
