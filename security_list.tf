locals {
  service_ports = [{min=80,max=80},{min=443,max=443},{min=22,max=22}]
}

resource "oci_core_security_list" "FoggyKitchenSecurityList" {
    compartment_id = "${oci_identity_compartment.FoggyKitchenCompartment.id}"
    display_name = "FoggyKitchenSecurityList"
    vcn_id = "${oci_core_virtual_network.FoggyKitchenVCN.id}"
    
    egress_security_rules {
	    protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    dynamic "ingress_security_rules" {
    for_each = local.service_ports
    content {
      protocol = "6"
        source = "0.0.0.0/0"
        tcp_options {
            max = ingress_security_rules.value.min
            min = ingress_security_rules.value.max
        }
    }

#    ingress_security_rules {
#        protocol = "6"
#        source = "0.0.0.0/0"
#        tcp_options {
#            max = "80"
#            min = "80"
#        }
#    }

#    ingress_security_rules {
#        protocol = "6"
#        source = "0.0.0.0/0"
#        tcp_options {
#            max = "443"
#            min = "443" 
#        }
#    }

#    ingress_security_rules {
#        protocol = "6"
#        source = "0.0.0.0/0"
#        tcp_options {
#            max = "22"
#            min = "22"
#        }
#    }

	ingress_security_rules {
	    protocol = "6"
        source = "${var.VCN-CIDR}"
    }
}
