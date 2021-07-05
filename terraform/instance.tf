resource "aws_instance" "mytestec2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "${var.ECS_INSTANCE_TYPE}"
  vpc_security_group_ids =["${aws_security_group.allow-ssh.id}"]
  key_name = "${var.KEY_NAME}"
  user_data = "${file("scripts/install_software.sh")}"
  tags = {
    Name = "MyTestEC2"
  }
}
