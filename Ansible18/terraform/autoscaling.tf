resource "aws_autoscaling_group" "my_asg" {
  name             = "MyASG"
  desired_capacity = 1
  min_size         = 1
  max_size         = 3
  launch_template {
    id      = aws_launch_template.server_template.id
    version = "$Latest"
  }
  #vpc_zone_identifier       = data.aws_subnets.default.ids
  target_group_arns         = [aws_lb_target_group.asg_target_group.arn]
  health_check_type         = "EC2"
  health_check_grace_period = 300

  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

  tag {
    key                 = "Name"
    value               = "myASG"
    propagate_at_launch = true
  }
}
