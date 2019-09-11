resource "oci_core_security_list" "FoggyKitchenSecurityList" {
    compartment_id = "${oci_identity_compartment.FoggyKitchenCompartment.id}"
    display_name = "FoggyKitchenHTTPSecurityList"
    vcn_id = "${oci_core_virtual_network.FoggyKitchenVCN.id}"
    
    egress_security_rules {
	    protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = "80"
            min = "80"
        }
    }

    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = "443"
            min = "443" 
        }
    }

    ingress_security_rules {
        protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = "22"
            min = "22"
        }
    }

	ingress_security_rules {
	    protocol = "6"
        source = "${var.VCN-CIDR}"
    }
}
