 terraform{
    required_version = "~> 1.2.0"
    required_providers{
        oci ={
            source = "oracle/oci"
            version = "~> 4.111.0"
        }
    }
}

provider "oci"{
    region = var.region
}
