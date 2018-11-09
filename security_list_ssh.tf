resource "oci_core_security_list" "FoggyKitchenSSHSecurityList" {
    compartment_id = "${oci_identity_compartment.FoggyKitchenCompartment.id}"
    display_name = "FoggyKitchenSSHSecurityList"
    vcn_id = "${oci_core_virtual_network.FoggyKitchenVCN.id}"
    egress_security_rules = [{
	protocol = "6"
        destination = "0.0.0.0/0"
    }]
    ingress_security_rules = [{
        tcp_options {
            "max" = 22
            "min" = 22
        }
        protocol = "6"
        source = "0.0.0.0/0"
    },
	{
	protocol = "6"
        source = "${var.VPC-CIDR}"
    }]	
}
