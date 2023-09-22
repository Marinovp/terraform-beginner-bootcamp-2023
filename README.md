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

### Printing vars in Linux

To print an env var using echo eg. `echo $HELLO`

### Scoping of env vars

If you want to env vars to persist accros all future basgh terminals that are open you need to set env vards

### AWS CLI Installation
AWS CLI is installed for this project via the bash script []'./bin/install_aws_cli'](./bin/install_aws_cli)

[Getting Started Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)


We can check if our AWS credentiasl are configured correctly by running the follwoing command:

```
aws sts get-caller-identity
```

If its succesful you should see a json payload return that look like this

```
{
    "UserId": "[user id]",
    "Account": "[AccountID]",
    "Arn": "[arn ]"
}
```

We'll need to generate AWS CLI credentials.

Issues when running scripts install_aws_cli

#Found preexisting AWS CLI installation: /usr/local/aws-cli/v2/current. Please rerun install script with --update flag.
Solutionl: updated the script and added --update to 
```
sudo ./aws/install --update
```

#Partial credentials found in env, missing: AWS_SECRET_ACCESS_KEY
Reimported the AWS_SECRE_ACCESS_KEY using the following command:
export AWS_SECRET_ACCESS_KEY=[access key]


#Terraform Basics

### Terraform Registry

Terraform sources their provifers and modules from 
the Terraform registry which is located at registry.
[Terraform Registry](https://registry.terraform.io/)

- **Provider** is an interface to APIs that will allow to create resources in Terraform
- **Modules** are a way to refactor or to make large amount of terraform code mudular, portable and shareable

Example
[Random terraform provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)

### Terraform console

We can see a list for all Terraform commands by simply typing `terraform` in the terminal


### Terraform Init
At the start of a new terraform project we will run `terraform init` to download the binaries
for the terraform providers that we'll use in this project

### Terraform Plan
This will generate out a changeset, about the state of our infrastructure and what will be changed.

We can output this changeset ie. "plan" to be passed to an apply, but this can be ignored.

### Terraform Apply
command: `terraform apply`

This will plan and pass the changeset to be plan and executed
To automatically approved an apply, this can be done using the `--auto-approve`
eg. `terraform apply -auto-approve`

### Terraform Lock Files
`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.

The Terraform Lock File should be committed to your Version Control System (VSV) eg. GitHub

### Terraform State Files

`.terraform.tfstate` contain information aboujt the current state of your infrastructure.

Thi file **should  not be committed** to yiour VCS.
This file contain sensitive data.
If you lose this file, you lose knowing the state of your infrastructure.

`.terraform.tfsstate.backup` is the previous state file state.

### Terraform directory

`.terraform` directory contains binaries of terraform providers.