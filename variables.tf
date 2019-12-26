variable "compartment_ocid" {
  description = "Compartment's OCID where VCN will be created. "
}

variable "vcn_display_name" {
  description = "Name of Virtual Cloud Network."
}

variable "vcn_cidr" {
  description = "A VCN covers a single, contiguous IPv4 CIDR block of your choice."
}

variable "vcn_dns_label" {
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet."
}

# IGW PARAMETERS

variable "create_igw" {
  description = "If set to true, create an Internet Gateway"
  default     = 0
}

variable "enable_igw" {
  description = "If set to true, Internet Gateway is enabled"
  default     = true
}

variable "igw_display_name" {
  description = "Name of Internet Gateway."
  default     = "IGW"
}

# NGW PARAMETERS
variable "create_ngw" {
  description = "If set to true, create a NAT Gateway"
  default     = 0
}

variable "block_ngw_traffic" {
  description = "If set to true, NAT Gateway traffic is blocked"
  default     = 0
}

variable "ngw_display_name" {
  description = "Name of NAT Gateway."
  default     = "NGW"
}

# DRG PARAMETERS
variable "create_drg" {
  description = "If set to true, create an Internet Gateway"
  default     = 0
}

variable "drg_display_name" {
  description = "Name of Dynamic Routing Gateway."
  default     = "DRG"
}

# LPG PARAMETERS

variable "create_spoke_lpg" {
  description = "If set to true, create a Local Peering Gateway for Spoke VCN"
  default     = 0
}

variable "spoke_lpg_display_name" {
  description = "Name of Local Peering Gateway for Spoke VCN"
  default     = "to_HUB"
}

variable "create_hub_lpg_routing_table" {
  description = "If set to true, create a Routing Table for Local Peering Gateway on HUB VCN"
  default     = 0
}

variable "hub_lpg_rt_display_name" {
  description = "Name of Routing Table for Local Peering Gateway on HUB VCN. Next Hop is DRG or NSA"
  default     = "LPG_to_NextHop"
}

variable "hub_lpg_nexthop" {
  description = "Next hop for traffic incoming from LPG. Next Hop is DRG OCID or NSA VNIC OCID"
  default     = ""
}
