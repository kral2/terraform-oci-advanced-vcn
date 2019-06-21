# Networking - VCN

resource "oci_core_vcn" "this" {
  dns_label      = "${var.vcn_dns_label}"
  cidr_block     = "${var.vcn_cidr}"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.vcn_display_name}"

  freeform_tags = {
    "Terraformed" = "yes"
    "TF-Module" = "advanced-vcn"
  }
}

# Internet Gateway
# * This type of gateway is used to give egress/ingress internet access to public subnets
resource "oci_core_internet_gateway" "this" {
  count          = "${var.create_igw}"
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.this.id}"
  display_name   = "${var.igw_display_name}"
  enabled        = "${var.enable_igw}"

  freeform_tags = {
    "Terraformed" = "yes"
    "TF-Module" = "advanced-vcn"
  }
}

# NAT Gateway
# * This type of gateway is used to give egress internet access to private subnets
resource "oci_core_nat_gateway" "this" {
  count          = "${var.create_ngw}"
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.this.id}"
  display_name   = "${var.ngw_display_name}"
  block_traffic  = "${var.block_ngw_traffic}"

  freeform_tags = {
    "Terraformed" = "yes"
    "TF-Module" = "advanced-vcn"
  }
}

# Dynamic Routing Gateway (DRG)
# * This type of gateway is used to access private networks outside of OCI, by using a private or dedicated network path

resource "oci_core_drg" "this" {
  count          = "${var.create_drg}"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.drg_display_name}"

  freeform_tags = {
    "Terraformed" = "yes"
    "TF-Module" = "advanced-vcn"
  }
}

resource "oci_core_drg_attachment" "this" {
  count          = "${var.create_drg}"
  drg_id         = "${oci_core_drg.this.id}"
  vcn_id         = "${oci_core_vcn.this.id}"
  route_table_id = "${oci_core_vcn.this.default_route_table_id}"
}

# Local Peering Gateways

## Spoke-LPG (acceptor)
resource "oci_core_local_peering_gateway" "spoke" {
  count          = "${var.create_spoke_lpg}"
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.this.id}"
  display_name   = "${var.spoke_lpg_display_name}"

  freeform_tags = {
    "Terraformed" = "yes"
    "TF-Module" = "advanced-vcn"
  }
}

## Hub-LPG resources

resource "oci_core_route_table" "hub-lpg-tonexthop" {
  count          = "${var.create_hub_lpg_routing_table}"
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.this.id}"
  display_name   = "${var.hub_lpg_rt_display_name}"

  route_rules = [
    {
      // route all traffic to HUB DRG
      destination = "0.0.0.0/0"

      network_entity_id = "${var.hub_lpg_nexthop}"
    },
  ]

  freeform_tags = {
    "Terraformed" = "yes"
    "TF-Module" = "advanced-vcn"
  }
}
