resource "aws_db_instance" "users_db" {
  instance_class    = "db.r5.4xlarge"
  multi_az          = true
  allocated_storage = 500
}

resource "aws_eip" "api_static" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = "eipalloc-xxx"
  subnet_id     = "subnet-xxx"
}