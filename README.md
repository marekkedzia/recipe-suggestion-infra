#  BigData infrastructure
Infrastructure is configured and deployed on Google Cloud

## Folder structure

### Accounts
Contains all accounts configuration and is ready for multi account deploy

* `variables.tf` all variables declarations that have to be provided on each account
* `terragrunt.hcl` terragrunt configuration with region, provider etc. File is created per each account. Based on this file, terraform files are created
* `terraform.tfvars` variable values for default environment
* `main.tf` main file describing environment based on main file from `modules`. Used for passing variables to environment configured in modules

### Modules
Contains all modules (templates) for services used in project

* `main` directory contains all GCP services used in project. All services are created from modules
* all other directories - modules totally independent of application

#### Main
* `variables.tf` variables declaration used to create environment with defaults. All this variables have to be provided in `./accounts/main.tf`
* all other directories - all services used. Each service has `source` which is location of module used, and all other properties required by module

#### Modules
Module is a service (set of services) description totally independent of our application shape. It means that module should not contain any
application specific code. Module consists of
* `inputs.tf` variables required by module
* `outputs.tf` variables produced by module
* `main.tf` module declaration
* `readme.md` module description

## Actions / commands

### Creating new environment
1. Copy and change properties filename `terragrunt.hcl`. Ex to create new staging env create copy of file with name `terragrunt-staging.hcl` and change `-var-file=terraform.tfvars` to `-var-file=terraform-staging.tfvars`
2. Copy and change properties filename `terraform.tfvars` and fill all variables that are declared in `variables.tf`. Ex to create new staging env create copy of file with name `terraform-staging.tfvars`

And you are done ! New env is ready to be deployed

### Deploying

#### Requirements
* `terraform` and `terragrunt` installed
* `GCP_ACCESS_KEY_ID` and `GCP_SECRET_ACCESS_KEY` exported

#### Commands
* `terragrunt apply` deploy default env run
* `terragrunt apply --terragrunt-config terragrunt-stagng.hcl` deploy staging env

## Auto-deploy
Auto-deploy is configured using GitHub actions and configuration is stored in `.github` dir

### Rules
* Each pull request triggers `terraform plan` and comments pull request with output
* Each push to `master` triggers `terraform apply` on default AWS account

## Create new microservice
1. Copy `microservice-backend.tf` and fill all required variables
2. Push docker image to correct repository
