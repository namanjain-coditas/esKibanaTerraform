data "template_file" "init-script" {
  template = file("kibanaScript.sh")
  vars = {
    PI="${aws_instance.example.private_ip}"
  }
}

data "template_cloudinit_config" "cloudinit-example"{
part{
	filename="kibanaScript.sh"
	content_type="text/x-shellscript"
	content="${data.template_file.init-script.rendered}"
}
}