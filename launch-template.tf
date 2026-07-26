resource "aws_launch_template" "web" {

  name_prefix   = "bluepeak-web-"
  image_id      = "ami-004f790b835b26145"
  instance_type = "t2.micro"
  key_name      = "BluePeak"

  vpc_security_group_ids = [
    aws_security_group.web-sg.id
  ]

  user_data = base64encode(file("${path.module}/data1.sh"))

  tag_specifications {

    resource_type = "instance"

    tags = {
      Name = "BluePeak-ASG-Web"
    }
  }

}


