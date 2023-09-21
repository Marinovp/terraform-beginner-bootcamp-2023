# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilize semantic versioning
[semver.org](https://semver.org/)

The General format:

***MAJOR.MINOR.PATCH***, eg 1.0.0

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes


##Install the Terraform CLI

### Considerations with the Terraform CLI changes
Terraform installation change due to error:
Refer to the latest CLI installation guide from Terraform website
[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

While fixing the Terraform CLI gpg deprecation issue, we noticed that bash scripts steps were more steps than initially was set up.
- This will keep the GitPod Task file tidy (.gitpod.yml)

[Gitpod workspace Task])(https://www.gitpod.io/docs/configure/workspaces/tasks)

### [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))
This will help create an executable scripts.
Add Shebang to the first line of the script. See ([install_terraform_cli])(./bin/install_terraform_cli)

Need to fix the permission on the file to executable using chmod, this will make the bash script executable.
See [Chmod](https://www.geeksforgeeks.org/chmod-command-linux)

