output "vcn_id" {
  description = "ocid of created VCN. "
  value       = "${oci_core_vcn.this.id}"
}

output "default_security_list_id" {
  description = "ocid of default security list. "
  value       = "${oci_core_vcn.this.default_security_list_id}"
}

output "default_dhcp_options_id" {
  description = "ocid of default DHCP options. "
  value       = "${oci_core_vcn.this.default_dhcp_options_id}"
}

output "default_route_table_id" {
  description = "ocid of default route table. "
  value       = "${oci_core_vcn.this.default_route_table_id}"
}

output "igw_id" {
  description = "ocid of internet gateway."
  value       = "${join("",oci_core_internet_gateway.this.*.id)}"
}

output "drg_id" {
  description = "ocid of dynamic routing gateway."
  value       = "${join("",oci_core_drg.this.*.id)}"
}

output "lpg_id" {
  description = "ocid of local peering gateway."
  value       = "${join("",oci_core_local_peering_gateway.spoke.*.id)}"
}

output "hub_lpg_rt_id" {
  description = "ocid of route table for HUB lpg. "
  value       = "${join("",oci_core_route_table.hub-lpg-tonexthop.*.id)}"
}
