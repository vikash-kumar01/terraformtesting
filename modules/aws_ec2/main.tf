
resource "aws_instance" "foo" {
  ami           = var.ami_image # us-west-2
  instance_type = var.instance_type

    network_interface {
        device_index            = 0
        network_interface_id    = var.nic_id
    }
}


variable "nic_id" {}


