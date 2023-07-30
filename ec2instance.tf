module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "my-instance"

  instance_type          = "t2.micro"
  key_name               = "Mykey"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}