
resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  user_data     = "${file("script.sh")}"

  tags = {
    Name  = "ElasticSearch"
  }
}

