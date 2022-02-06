# Terraform Learning

This repository contains some resources from Terraform documentation that we could use for learning the concept of Terraform and how we use it. It also contains sample code that we could use in practicing actual implementation of Terraform.

## Terraform Installation
### MacOS
We could use Homebrew to directly download Terraform to local MacOS environment.

Firstly, install the Hashicorp tap.

`brew tap hashicorp/tap`

Now, install Terraform from the tap installed above.

`brew install hashicorp/tap/terraform`

### Ubuntu
We could use apt package approach to install Terraform in Ubuntu.

Firstly, you need to install gnupg, software-properties-common, and curl packages.

`sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl`

Add Hashicorp GPG key.

`curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`

Add Hashicorp official Linux repository.

`sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`

Update local apt packages and install Terraform.

`sudo apt-get update && sudo apt-get install terraform`

### Other OS
You could refer directly to Terraform documentation for other OS Terraform installation. Refer to [this link](https://learn.hashicorp.com/tutorials/terraform/install-cli).

### Installation using TFSwitch
TFSwitch is a tool maintained by warrensbox that enable us to switch between Terraform version very easily. This tool will automatically install specific version of Terraform to our machine based on the version we chose. Please find the installation methods directly from the documentation [here](https://tfswitch.warrensbox.com/Install/).

## [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/quick-start/) Installation
### MacOS and Linux
We could use Homebrew to directly download Terraform to local MacOS environment.

`brew install terragrunt`

### Other OS
For installation for other OS or directly download from terragrunt repository, you could refer to the procedure [here](https://terragrunt.gruntwork.io/docs/getting-started/install)
