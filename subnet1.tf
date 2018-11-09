resource "oci_core_subnet" "FoggyKitchenSubnet1" {
  availability_domain = "${var.ADs[0]}"
  cidr_block = "10.0.1.0/24"
  display_name = "FoggyKitchenSubnet1"
  dns_label = "FoggyKitchenN1"
  compartment_id = "${oci_identity_compartment.FoggyKitchenCompartment.id}"
  vcn_id = "${oci_core_virtual_network.FoggyKitchenVCN.id}"
  route_table_id = "${oci_core_route_table.FoggyKitchenRouteTable1.id}"
  dhcp_options_id = "${oci_core_dhcp_options.FoggyKitchenDhcpOptions1.id}"
  security_list_ids = ["${oci_core_security_list.FoggyKitchenSSHSecurityList.id}","${oci_core_security_list.FoggyKitchenHTTPSecurityList.id}","${oci_core_security_list.FoggyKitchenHTTPSSecurityList.id}"]
}

