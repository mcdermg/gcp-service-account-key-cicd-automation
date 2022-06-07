# Project Title

Service account and associated key and stored in a GitHub secret.

## Description

Testing the creation of a service account and associated key and passing it to GitHub secret.

# Requirements

## Terraform
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.1.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project-factory-sa"></a> [project-factory-sa](#module\_project-factory-sa) | terraform-google-modules/service-accounts/google | 4.1.1 |

## Resources

| Name | Type |
|------|------|
| [null_resource.circleci_context_secret](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account_id"></a> [billing\_account\_id](#input\_billing\_account\_id) | The billing account ID to associate with the project. | `string` | n/a | yes |
| <a name="input_circelci_vcs"></a> [circelci\_vcs](#input\_circelci\_vcs) | Circleci VCS either github or bitbucket | `string` | n/a | yes |
| <a name="input_circleci_context"></a> [circleci\_context](#input\_circleci\_context) | Name ofd the CircleCI context to use | `string` | n/a | yes |
| <a name="input_circleci_context_secret_name"></a> [circleci\_context\_secret\_name](#input\_circleci\_context\_secret\_name) | Name of the secret to create in the CircleCI context | `string` | n/a | yes |
| <a name="input_circleci_org"></a> [circleci\_org](#input\_circleci\_org) | Name of the Github Org used in CircleCI | `string` | n/a | yes |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | GitHub organization to use | `string` | n/a | yes |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | GitHub api token | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The GCP organization ID | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix applied to service account names. | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which to provision resources. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Github

TODO GitHub  provider and details

## CircleCI

messing with local execs to sort this, seems to work but needs CircelCI cli. That requires an API key and running certain commands to setup.

install as per the [Circelci docs](https://circleci.com/docs/2.0/local-cli/)
```
curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | bash
```

```
circleci setup
circleci context create github mcdermg testing

```
- [CircelCI contexts docs](https://circleci.com/docs/2.0/contexts/)

- [Reading base 64 in a circel job](https://support.circleci.com/hc/en-us/articles/360003540393-How-to-insert-files-as-environment-variables-with-Base64)

### Deployment

* How to run the
```
terraform init
terraform plan
terrafrom apply
```

## pre-commit
This repo is using pre-commit for Terraform to ensure some standardization for Terraform layout & standards.
See [pre-commit hooks](https://github.com/antonbabenko/pre-commit-terraform) for Terraform. There are some dependencies that are [detailed here](https://github.com/antonbabenko/pre-commit-terraform#1-install-dependencies). The repository uses the following pre commit hooks:

* [terraform fmt](https://github.com/antonbabenko/pre-commit-terraform#terraform_fmt)
* [terraform validate](https://github.com/antonbabenko/pre-commit-terraform#terraform_validate)
* [terrafrom docs](https://github.com/antonbabenko/pre-commit-terraform#terraform_docs)

Run `pre-commit install` to enable.

## Authors

Gary Mc Dermott

<a href="https://github.com/mcdermg" target="_blank">Github Profile</a>

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
