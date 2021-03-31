
resource "aws_instance" "kibana" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  
  user_data     = data.template_cloudinit_config.cloudinit-example.rendered
  tags = {
    Name  = "Kibana instance"
  }
  depends_on = [
    aws_instance.example,
  ]
}

