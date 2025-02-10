resource "aws_autoscaling_group" "asg" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids
  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "asg-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_alb" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  alb_target_group_arn   = var.target_group_arn
}
