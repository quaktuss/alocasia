resource "aws_launch_template" "custom_ubuntu_2404" {
  name                                 = "default-launchconfig"
  image_id                             = data.aws_ami.ubuntu.id
  instance_type                        = var.instance_type
  instance_initiated_shutdown_behavior = var.terminated_instance
  user_data                            = base64encode("${templatefile("${path.module}/${var.default_user_data}", {})}${var.custom_user_data}")
  key_name                             = data.aws_key_pair.default_test_keypair.key_name

}

# Default ASG setting after deploy
resource "aws_autoscaling_group" "asg-default" {
  name               = var.autoscaling_group_name
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
resource "aws_autoscaling_schedule" "name" {
  scheduled_action_name  = "auto-scaledown"
  autoscaling_group_name = aws_autoscaling_group.asg-default.name
  recurrence             = var.instance_schedule
  max_size               = 0
  min_size               = 0
  desired_capacity       = 0

}
