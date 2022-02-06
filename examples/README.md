# Terraform Workflow
Terraform workflow mainly consists of init, plan, and apply. In this readme file and example, we assume to run all Terraform commands in the same path as our Terraform code.

## Terraform Init
To initialize Terraform state file locally (and remote state if Terraform backend configuration is specified) and download Terraform libraries and dependencies, run `terraform init` command.

## Terraform Plan
After the Terraform state file and dependencies has been initialized, we could do a dry-run execution to check the resources that will be generated using the provided Terraform code. To do this, run `terraform plan`.

## Terraform Apply
If we already sure about the plan result of Terraform, we could deploy our infrastructure by executing command `terraform apply`. This command will also generate plan result in the output and also a prompt asking us once more whether to deploy the changes or not. Type `yes` to proceed, type anything to abort. To bypass the prompt you could use command `terraform apply -auto-approve`.

## Terraform Fmt
To tidy up our Terraform code and also finds out some misconfigured syntax and basic lint, we could run `terraform fmt`.