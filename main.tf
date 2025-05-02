terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
    required_version = ">= 0.14.9"
}
provider "aws" {
    region = "us-east-1"
}
module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = "10.0.0.0/16"
    public_subnet_cidr = "10.0.1.0/24"
    private_subnet_cidr = "10.0.2.0/24"
    availability_zone = "us-east-1a"
    availability_zone_2 = "us-east-1b"
}
module "ec2" {
    source = "./modules/ec2"
    subnet_id = module.vpc.subnet_id
    security_group_id = module.vpc.security_group_id
    availability_zone = module.vpc.availability_zone
    key_name = "terraform"
    ami = "ami-0b5eea76982371e7f"
    instance_type = "t2.micro"
    instance_name = "terraform-instance"
}
module "rds" {
    source = "./modules/rds"
    subnet_id = module.vpc.subnet_id
    security_group_id = module.vpc.security_group_id
    availability_zone = module.vpc.availability_zone
    db_subnet_group_name = "db-subnet-group"
    allocated_storage = 20
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t2.micro"
    username = "XXXXX"
    password = "XXXXXXXX"
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot = true
    db_name = "terraformdb"
}
resource "parameter_group_name" "name" {
    name = "default.mysql5.7"
    family = "mysql5.7"
    description = "MySQL 5.7 parameter group"
    parameter {
        name = "character_set_server"
        value = "utf8"
    }
    parameter {
        name = "character_set_client"
        value = "utf8"
    }
    lifecycle {
        create_before_destroy = true
    }
}
