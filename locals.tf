locals {

  vpc_cidr = "10.70.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Name         = "${var.environment}"
    Environment  = var.environment
    Provisionner = var.provisioner
  }

  user_data = base64encode(file("user-data.sh"))
}
