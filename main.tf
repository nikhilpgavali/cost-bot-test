resource "aws_db_instance" "users_db" {
  instance_class    = "db.r5.4xlarge"
  multi_az          = true
  allocated_storage = 500
}

resource "aws_eks_cluster" "platform" {
  name = "production"
}

resource "aws_lambda_function" "image_resize" {
  function_name = "resize"
  memory_size   = 3008
  runtime       = "nodejs14.x"
}

resource "aws_dynamodb_table" "users" {
  name           = "users"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"
}

resource "aws_nat_gateway" "staging" {
  subnet_id     = "subnet-xxx"
  allocation_id = "eipalloc-xxx"
  tags = { Environment = "staging" }
}

resource "aws_s3_bucket" "uploads" {
  bucket = "my-uploads"
}
