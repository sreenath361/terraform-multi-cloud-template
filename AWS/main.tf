# This Terraform Code Deploys VPC Infra.
provider "aws" {
    region = "us-east-1"
}

# Store Terraform state remotely
terraform {
backend "s3" {
bucket = "bosch-statefile"
key = "terraform.tfstate"
region = "us-east-1"
 # Replace this with your DynamoDB table name!
   # dynamodb_table = "terraform-up-and-running-locks"
   # encrypt        = true
   }
}

# VPC module
module Bosch-VPC {
    source = "/home/ubuntu/terraform_templates/AWS/networking/VPC"
    vpc_cidr = "10.30.0.0/16"
    vpc_name = "Bosch-Dev-1"
    IGW_name = "Bosch-Dev-IGW"
    #Main_Routing_Table = "Terraform_Main_table-testing"
    #key_name = "netflix"
    environment = "Dev"
    azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
    publiccidrs = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
    privatecidrs = ["10.30.10.0/24", "10.30.20.0/24", "10.30.30.0/24"]
}

# EC2 instance creation module
module Launch-EC2 {
    source = "/home/ubuntu/terraform_templates/AWS/compute/EC2"
    imagename = "ami-0fc5d935ebf8bc3bc"
    instance_type = "t2.micro"
    key_name = "netflix"
    environment ="${module.Bosch-VPC.env}"
    machinecount = "${module.Bosch-VPC.env}" == "Prod" ? 3: 1
    public_subnets = module.Bosch-VPC.all_public_subnets
    sg = module.Bosch-VPC.sg_id   
    #iam_instance_profile = "${module.test_iam.instprofile}"
}
