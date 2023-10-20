

#This is how you create Terraform in OCI manually

variable "region" {
    description = "Region name. List region with 'OCI IAM region here."
    type        = string
   
}

variable "compartment_id" {
    description = "The compartment is like a container that holds resources"
    type        = string
    sensitive   = true
}

variable "vcn_cidr_blocks" {
    description = "List of CIDR_BLOCKs for the private IPv4 within the VCN"
    type        = list(string)
   
}

variable "vcn_display_name" {
    description = "Display the name for the VCN"
    type        = string
    
}

variable "vcn_dns_labal" {
    description = "A private DNS label from within the VCN"
    type        = string
    
}

variable "internet_gateway_display_name" {
    description = "Display name for the internet gateway"
    type        = string
    
}

variable "service_gateway_display_name" {
    description = "Display name for the service gateway"
    type        = string
    
}

variable "nat_gateway_display_name" {
    description = "Display name for the nat gateway"
    type        = string
    
}

variable "all_services_id" {
    description = <<-EOT
      Region-specific service OCID for all-services in the Oracle Service Network.
      CLI will list all regions service OCID with this command 'oci network service list'
    EOT  
    type        = string
    
}

variable "all_services_id" {
    description = <<-EOT
      Region-specific service CIDR for all-services in the Oracle Service Network.
      CLI will list all regions service OCID with this command 'oci network service list'
    EOT  
    type        = string
    
}


variable "public_route_table_display_name" {
    description = "Display name for the public route table"
    type        = string
    
}

variable "private_route_table_display_name" {
    description = "Display name for the private route table"
    type        = string
    
}


variable "public_subnet_display_name" {
    description = "display name for the public subnet"
    type        = string
    
}

variable "public_subnet_dns_label" {
    description = "Private DNS label within the public subnet"
    type        = string
    
}

variable "private_subnet_cidr_block" {
    description = "Single private IPv4 CIDR block for the private subnet"
    type        = string
    
}

variable "private_subnet_display_name" {
    description = "display name for the private subnet"
    type        = string
    
}

variable "private_subnet_dns_label" {
    description = "Private DNS label within the private subnet"
    type        = string
    
}




#variable "" {
    #description = ""
    #type        = string
    
# }


