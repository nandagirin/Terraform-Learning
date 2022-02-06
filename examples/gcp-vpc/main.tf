locals {
  vpc_name                            = "sandbox-vpc"
  vpc_auto_create_subnetworks         = false
  vpc_routing_mode                    = "REGIONAL"
  vpc_mtu                             = 1500
  vpc_delete_default_routes_on_create = false

  cloud_router_name = "sandbox-router"
  
  cloud_nat_name                                = "sandbox-nat"
  cloud_nat_source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  cloud_nat_ip_allocation_option                = "MANUAL_ONLY"
}

# Resources are the most important element in the Terraform language. Each resource block describes one or more 
# infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records.
# A resource block declares a resource of a given type ("google_compute_network") with a given local name ("vpc"). The name 
# is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside that module's scope.
# The resource type and name together serve as an identifier for a given resource and so must be unique within a module.
# Within the block body (between { and }) are the configuration arguments for the resource itself. Most arguments in this section 
# depend on the resource type, and indeed in this example both ami and instance_type are arguments defined specifically for the aws_instance resource type.
resource google_compute_network vpc {
  name                            = local.vpc_name
  auto_create_subnetworks         = local.vpc_auto_create_subnetworks
  routing_mode                    = local.vpc_routing_mode
  mtu                             = local.vpc_mtu
  project                         = local.project_id
  delete_default_routes_on_create = local.vpc_delete_default_routes_on_create
}

# In summary, applying a Terraform configuration will:
#   Create resources that exist in the configuration but are not associated with a real infrastructure object in the state.
#   Destroy resources that exist in the state but no longer exist in the configuration.
#   Update in-place resources whose arguments have changed.
#   Destroy and re-create resources whose arguments have changed but which cannot be updated in-place due to remote API limitations.
resource google_compute_subnetwork subnet {
  name          = "subnet-${terraform.workspace}"
  ip_cidr_range = "10.0.0.0/24"
  ##########################################################################################################################
  # Expressions within a Terraform module can access information about resources in the same module, 
  # and you can use that information to help configure other resources. Use the <RESOURCE TYPE>.<NAME>.<ATTRIBUTE> 
  # syntax to reference a resource attribute in an expression. In addition to arguments specified in the configuration, 
  # resources often provide read-only attributes with information obtained from the remote API; this often includes things
  # that can't be known until the resource is created, like the resource's unique random ID.
  ##########################################################################################################################
  network       = google_compute_network.vpc.id
  region        = "us-central1"
  project       = "sandbox"

  secondary_ip_range = [
    {
      range_name    = "pod-range"
      ip_cidr_range = "10.0.1.0/24"
    },
    {
      range_name    = "service-range"
      ip_cidr_range = "10.0.2.0/24"
    }
  ]
}

resource google_compute_router cloud_router {
  name    = local.cloud_router_name
  network = google_compute_network.vpc.name
  region  = local.project_region
  project = local.project_id
}

resource google_compute_router_nat cloud_nat {
  name                                = local.cloud_nat_name
  router                              = google_compute_router.cloud_router.name
  region                              = google_compute_router.cloud_router.region
  source_subnetwork_ip_ranges_to_nat  = local.cloud_nat_source_subnetwork_ip_ranges_to_nat
  nat_ip_allocation_option            = local.cloud_nat_ip_allocation_option
  ###############################################################################################
  # Each data instance will export one or more attributes, which can be used in other resources 
  # as reference expressions of the form data.<TYPE>.<NAME>.<ATTRIBUTE>.
  ###############################################################################################
  nat_ips                             = [data.google_compute_address.nat_ip.self_link]
}
