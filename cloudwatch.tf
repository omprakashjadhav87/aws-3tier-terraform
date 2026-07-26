# Scale out when CPU is high
resource "aws_autoscaling_policy" "scale_out" {

  name                   = "BluePeak-Scale-Out"
  autoscaling_group_name = aws_autoscaling_group.web.name

  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = 1

  cooldown = 300

}

#CloudWatch alarm:

resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name          = "BluePeak-High-CPU"
  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"

  period    = 300
  statistic = "Average"

  threshold = 70

  alarm_description = "Scale out when average EC2 CPU exceeds 70 percent"

  dimensions = {

    AutoScalingGroupName = aws_autoscaling_group.web.name

  }

  alarm_actions = [

    aws_autoscaling_policy.scale_out.arn

  ]

}


# Scale in when CPU is low

resource "aws_autoscaling_policy" "scale_in" {

  name                   = "BluePeak-Scale-In"
  autoscaling_group_name = aws_autoscaling_group.web.name

  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = -1

  cooldown = 300

}

resource "aws_cloudwatch_metric_alarm" "low_cpu" {

  alarm_name          = "BluePeak-Low-CPU"
  comparison_operator = "LessThanThreshold"

  evaluation_periods = 2
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"

  period    = 300
  statistic = "Average"

  threshold = 30

  alarm_description = "Scale in when average EC2 CPU is below 30 percent"

  dimensions = {

    AutoScalingGroupName = aws_autoscaling_group.web.name

  }

  alarm_actions = [

    aws_autoscaling_policy.scale_in.arn

  ]

}