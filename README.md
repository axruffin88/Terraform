# Terraform in OCI

Creating terraforming on Oracle cloud Infrastructure (OCI) using oracle's cloud shell and VScode.

https://registry.terraform.io/providers/oracle/oci/latest/docs

You'll find the documentation for the OCI provider in the link above. While on the page, just go down to the service or service family that you're interested in; as an example, when it comes to the service family I am creating with the network.tf, provider.tf, and variables.tf files, I am using the vcn-core to find the resource in the documentation, which are similar to the OCI's resources on their platform, that matches OCI core Virtual Cloud Network (VCN) within the documentation. In short, if all of that sounds confusing just understand that when creating terraform in any cloud platform, one needs to mimic creating the resources in terraform just like one would create those resources on the cloud platform. Thus the documentation (docs) are very helpful because there one will see that some resource cannot be created with out other or another type of resource; as an example, a VCN cannot be create in terraform without subnets, CIDR-blocks .

#Understanding this Project.

Oracle Cloud Infrastructure (OCI) platform allows services to be used to create resource to use as tool to complete jobs or task, such as file big data archiving or backup, file storage, disaster recovery, or Infrastructure or Platform as a service (IaaS or PaaS), social networking, etc. Now we will focus on more on IaaS because we can create a resource called virtual cloud network (VCN) using OCI platform network service, or we can use OCI to create Infrastructure as code (IaC), which, in short, means use terraform to create resources in OCI. First, create a folder and save network.tf, provider.tf, and variables.tf files in that folder. Next, you will need to set up an Oracle cloud account. Then in OCI platform, navigate to the Resource Manager and click on stacks. Click on create a stack and create a stack but be sure to add the folder with the three files into the stack.  To conclude, stack means terraform in OCI and using terraform leaves room for less errors, better access control, predictability, and remote state management.
Thank you and enjoy! 

