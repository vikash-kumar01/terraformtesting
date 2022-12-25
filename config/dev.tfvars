vpc_cidr_range = "192.168.0.0/16"
vpc_tags    =  {
    Name = "vpc"
    Environmet = "dev"
}


public_subnet1_cidr = "192.168.0.0/24"
public_subnet1_availability_zone = "us-east-1a"
public_subnet1_tags = {
    Name = "public_subnet_1"
    Environmet = "dev"

}

public_subnet2_cidr = "192.168.1.0/24"
public_subnet2_availability_zone ="us-east-1b"
public_subnet2_tags = {
    Name = "public_subnet_2"
    Environmet = "dev"

}

private_subnet1_cidr = "192.168.2.0/24"
private_subnet1_availability_zone = "us-east-1a"
private_subnet1_tags = {
    Name = "private_subnet_1"
    Environmet = "dev"

}

private_subnet2_cidr = "192.168.3.0/24"
private_subnet2_availability_zone = "us-east-1b"
private_subnet2_tags = {
    Name = "private_subnet_2"
    Environmet = "dev"

}


########## EC2

ami_image1     = "ami-0574da719dca65348"
instance_type1 = "t2.micro"

ami_image2     = "ami-0574da719dca65348"
instance_type2 = "t2.micro"



############### S3

bucket_name1 = "vikashashoke123456"
bucket_name2 = "vikashashoke1234567"