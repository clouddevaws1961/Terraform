resource "aws_instance" "JenkinsServer" {
  ami = var.ami
  disable_api_termination = true
  key_name = aws_key_pair.LinuxInstanceKeyPair.key_name
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  user_data = var.user_data
  
  vpc_security_group_ids = [var.awsjenkinssecuritygroup]
  tags = {
    Name="Jenkins Server"
  }
}


resource "aws_key_pair" "LinuxInstanceKeyPair" {
  public_key = var.publickeyjenkins
  key_name = var.key_name
}

