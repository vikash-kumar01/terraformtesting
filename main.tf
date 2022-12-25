module "vpc" {

    source = "./modules/aws_vpc"

    vpc_cidr_block = var.vpc_cidr_range 
    tags           = var.vpc_tags
}

module "public_subnet1" {
  
   source = "./modules/aws_subnet"
   
   vpc_id = module.vpc.vpc_id
   subnet_cidr_block = var.public_subnet1_cidr
   availability_zone = var.public_subnet1_availability_zone
   tags = var.public_subnet1_tags
}


module "public_subnet2" {
  
   source = "./modules/aws_subnet"
   
   vpc_id = module.vpc.vpc_id
   subnet_cidr_block = var.public_subnet2_cidr
   availability_zone = var.public_subnet2_availability_zone
   tags = var.public_subnet2_tags
}


module "private_subnet1" {
  
   source = "./modules/aws_subnet"
   
   vpc_id = module.vpc.vpc_id
   subnet_cidr_block = var.private_subnet1_cidr
   availability_zone = var.private_subnet1_availability_zone
   tags = var.private_subnet1_tags
}

module "private_subnet2" {
  
   source = "./modules/aws_subnet"
   
   vpc_id = module.vpc.vpc_id
   subnet_cidr_block = var.private_subnet2_cidr
   availability_zone = var.private_subnet2_availability_zone
   tags = var.private_subnet2_tags
}


module "igw" {

    source =  "./modules/aws_igw"
    vpc_id =  module.vpc.vpc_id
}


module "public_RT" {

    source =  "./modules/aws_route_table"

    vpc_id =  module.vpc.vpc_id
    gateway_id = module.igw.igw_id
}

module "publicsubnet1_RT_Association" {

    source =  "./modules/aws_rt_association"

    subnet_id      =  module.public_subnet1.subnet_id
    route_table_id = module.public_RT.rt_id
}

module "publicsubnet2_RT_Association" {

    source =  "./modules/aws_rt_association"

    subnet_id      =  module.public_subnet2.subnet_id
    route_table_id = module.public_RT.rt_id
}


module "ep1" {

    source =  "./modules/aws_eip"
}

module "ep2" {

    source =  "./modules/aws_eip"
}

module "natgw1"{

        source =  "./modules/aws_natgw"

        epi_id = module.ep1.eip_id
        subnet_id = module.public_subnet1.subnet_id
}

module "natgw2"{

        source =  "./modules/aws_natgw"

        epi_id = module.ep2.eip_id
        subnet_id = module.public_subnet2.subnet_id
}


module "private_RT1" {

    source =  "./modules/aws_route_table"

    vpc_id =  module.vpc.vpc_id
    gateway_id = module.natgw1.natgw_id
}

module "private_RT2" {

    source =  "./modules/aws_route_table"

    vpc_id =  module.vpc.vpc_id
    gateway_id = module.natgw2.natgw_id
}


module "privatesubnet1_RT_Association" {

    source =  "./modules/aws_rt_association"

    subnet_id      =  module.private_subnet1.subnet_id
    route_table_id = module.private_RT1.rt_id
}

module "privatesubnet2_RT_Association" {

    source =  "./modules/aws_rt_association"

    subnet_id      =  module.private_subnet2.subnet_id
    route_table_id = module.private_RT2.rt_id
}

# 1 instance in public 1 in private subnet


module "instance1" {

    source =  "./modules/aws_ec2"

    ami_image      =  var.ami_image1
    instance_type   = var.instance_type1
    nic_id          = module.nic1.nic_id

    depends_on = [
      module.nic1
    ]
}

module "instance2" {

    source =  "./modules/aws_ec2"

    ami_image      =  var.ami_image2
    instance_type   = var.instance_type2
    nic_id          = module.nic2.nic_id

depends_on = [
      module.nic2
    ]
}


## ??
module "nic1" {

    source =  "./modules/aws_network_interface"

    subnet_id      =  module.public_subnet1.subnet_id

}


module "nic2" {

    source =  "./modules/aws_network_interface"

    subnet_id      =  module.private_subnet1.subnet_id

}



module "s3_bucket1" {
  
  source = "./modules/aws_s3"

  bucket_name = var.bucket_name1
  tags        = {

    "name" = "s3_1"
  }
}

module "s3_bucket2" {
  source = "./modules/aws_s3"

  bucket_name = var.bucket_name2
  tags    = {

    "name" = "s3_2"
  }
}

