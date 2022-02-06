terraform {}

# Terraform relies on plugins called "providers" to interact with cloud providers, SaaS providers, and other APIs.
# Terraform configurations must declare which providers they require so that Terraform can install and use them. 
# Additionally, some providers require configuration (like endpoint URLs or cloud regions) before they can be used.
# Each provider adds a set of resource types and/or data sources that Terraform can manage.
# Every resource type is implemented by a provider; without providers, Terraform can't manage any kind of infrastructure.
# Most providers configure a specific infrastructure platform (either cloud or self-hosted). Providers can also offer 
# local utilities for tasks like generating random numbers for unique resource names.
#
# The name given in the block header ("google" in this example) is the local name of the provider to configure. 
# This provider should already be included in a required_providers block. The body of the block (between { and }) 
# contains configuration arguments for the provider. Most arguments in this section are defined by the provider itself; 
# in this example both project and region are specific to the google provider. You can use expressions in the values 
# of these configuration arguments, but can only reference values that are known before the configuration is applied. 
# This means you can safely reference input variables, but not attributes exported by resources (with an exception 
# for resource arguments that are specified directly in the configuration). A provider's documentation should list 
# which configuration arguments it expects. For providers distributed on the Terraform Registry, versioned documentation 
# is available on each provider's page, via the "Documentation" link in the provider's header.
provider google {
  project = var.project_id
}
