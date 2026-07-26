resource "aws_autoscaling_group" "web" {
  name                = "BluePeak-Web-ASG"
  desired_capacity    = 2
  min_size            = 2
  max_size            = 4
  vpc_zone_identifier = [
    aws_subnet.public-subnet1.id,
    aws_subnet.public-subnet2.id
  ]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  target_group_arns = [
    aws_lb_target_group.target_elb.arn
  ]
}