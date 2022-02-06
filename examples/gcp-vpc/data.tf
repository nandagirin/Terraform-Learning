# Data sources allow Terraform use information defined outside of Terraform, 
# defined by another separate Terraform configuration, or modified by functions.
# A data block requests that Terraform read from a given data source ("google_compute_address") and export the result under the given local name ("nat_ip"). 
# The name is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside of the scope of a module.
# The data source and name together serve as an identifier for a given resource and so must be unique within a module.
# Within the block body (between { and }) are query constraints defined by the data source. Most arguments in this section depend on the data source,
# and indeed in this example most_recent, owners and tags are all arguments defined specifically for the aws_ami data source.
data google_compute_address nat_ip {
  name = local.cloud_nat_ip_name
}
