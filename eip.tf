module "eip" {
  source  = "app.terraform.io/jonasfost/eip/aws"
  version = "1.0.0"

  instance = module.bastion_host.id

  tags = {
    Name         = "${var.environment}-bastion-eip"
    Environment  = var.environment
    Provisionner = var.provisioner
  }
}