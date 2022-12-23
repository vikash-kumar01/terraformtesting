resource "aws_nat_gateway" "example" {
  allocation_id = var.epi_id
  subnet_id     = var.subnet_id

}

output "natgw_id" {
  value = aws_nat_gateway.example.id
}


# Lets launch ec2 instances into public and private subnets

