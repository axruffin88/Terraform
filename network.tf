#This

# VCN 
resource "oci_core_vcn" "mastodon_vcn" {
    compartment_id  = var.compartment_id
    cidr_blocks     = var.cidr_blocks
    display_name    = var.display_name
    dns_label       = var.dns_label 
}

# Gateways
resource "oci_core_internet_gateway" "internet_gateway" {
    compartment_id = var.compartment_id
    vcn_id         = oci_core_vcn.mastodon_vcn.id
    display_name   = var.internet_gateway_display_name
   
}
resource "oci_core_server_gateway" "server_gateway" {
    compartment_id = var.compartment_id
    vcn_id         = oci_core_vcn.mastodon_vcn.id
    display_name   = var.server_gateway_display_name
    server{
        server_id  = var.all_services_id
    }
}
resource "oci_core_nat_gateway" "nat_gateway" {
    compartment_id = var.compartment_id
    vcn_id         = oci_core_vcn.mastodon_vcn.id
    display_name   = var.nat_gateway_display_name
   
}

# Route table
resource "oci_core_route_table" "public_route_table" {
    compartment_id = var.compartment_id
    vcn_id         = oci_core_vcn.mastodon_vcn.id
    display_name   = var.public_route_table_display_name
    route_rules{
        network_entity_id = oci_core_internet_gateway.internet_gateway.id
        destination_type  = "CIDR_BLOCK"
        destination       = "0.0.0.0/0"
    }
   
}
resource "oci_core_route_table" "private_route_table" {
    compartment_id = var.compartment_id
    vcn_id         = oci_core_vcn.mastodon_vcn.id
    display_name   = var.private_route_table_display_name
    route_rules{
        network_entity_id = oci_core_internet_gateway.nat_gateway.id
        destination_type  = "CIDR_BLOCK"
        destination       = 0.0.0.0/0 #I will change this because I need it to be private.
    }
    route_rules{
        network_entity_id = oci_core_internet_gateway.service_gateway.id
        destination_type  = "SERVICE_CIDR_BLOCK"
        destination       = "var.all_services_cidr"
    }
   
}

# Subnets
resource "oci_core_subnet" "public_subnet" {
    compartment_id = var.compartment_id
    vcn_id         = oci_core_vcn.mastodon_vcn.id
    cidr_block     = var.public_subnet_cidr_block
    display_name   = var.public_subnet_table_display_name
    dns_label      = var.public_subnet_dns_label
    route_table_id = oci_core_route_table.public_route_table.id
    security_list_ids = [
        oci_core_vcn.mastodon_vcn.default_security_list_id
    ]
    prohibit_public_ip_on_vnic = false
} 
resource "oci_core_subnet" "private_subnet" {
    compartment_id = var.compartment_id
    vcn_id         = oci_core_vcn.mastodon_vcn.id
    cidr_block     = var.private_subnet_cidr_block
    display_name   = var.private_subnet_table_display_name
    dns_label      = var.private_subnet_dns_label
    route_table_id = oci_core_route_table.private_route_table.id
    security_list_ids = [
        oci_core_vcn.mastodon_vcn.default_security_list_id
    ]
    prohibit_public_ip_on_vnic = true
} 




#To list all compartment's OCIDs using CLI 'Below, everything inside belong on one line'
#'oci iam compartment list --query "data[?name=='CloudOpsRecordings']" 
#--compartment-id-in-subtree true --all'
