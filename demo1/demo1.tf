variable "instanceType" {
   default = "t1.micro"
}

provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/omer/.aws/credentials"
  #shared_credentials_file = "/Users/omerkaratas/.aws/credentials"

  version = ">= 1.24.0"
}

resource "aws_instance" "tfdemo" {
# https://www.terraform.io/docs/providers/aws/index.html

  instance_type = "${var.instanceType}"
  ami = "ami-061b1560" # centos ami in es-west-1

#  monitoring = "false"
#  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
#  key_name = "${var.keyName}"
  disable_api_termination = false
  associate_public_ip_address = true

#  vpc_security_group_ids = ["${aws_security_group.karbon_int_sg.id}"]
#  subnet_id = "${aws_subnet.az1.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = 20
    delete_on_termination = true
  }

  tags {
    Name = "tfDemo-dev"
    project = "tfDemo"
  }

}
