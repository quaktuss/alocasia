resource "aws_launch_template" "custom_ubuntu_2404" {
  name                                 = "${var.name_prefix}-ltemplate"
  image_id                             = data.aws_ami.ubuntu.id
  instance_type                        = var.instance_type
  instance_initiated_shutdown_behavior = var.terminated_instance
  user_data                            = base64encode("${templatefile("${local.default_user_data}", {})}${var.custom_user_data}")
}

# Default ASG setting after deploy
resource "aws_autoscaling_group" "asg-default" {
  name               = "${var.name_prefix}-asg"
  availability_zones = ["eu-west-1a"]
  min_size           = 0
  desired_capacity   = 1
  max_size           = 1
  launch_template {
    id      = aws_launch_template.custom_ubuntu_2404.id
    version = "$Latest"
  }
}

# Auto scaledown ASG
resource "aws_autoscaling_schedule" "scaledown" {
  scheduled_action_name  = "0a-dhole-auto-scaledown"
  autoscaling_group_name = aws_autoscaling_group.asg-default.name
  recurrence             = var.instance_schedule
  max_size               = 0
  min_size               = 0
  desired_capacity       = 0
}
