module "ec2_custom" {
  source                 = "./modules/compute"
  count                  = length(var.asg_compute)
  custom_user_data       = templatefile("${var.asg_compute[count.index].custom_user_data_filename}", {})
  autoscaling_group_name = var.asg_compute[count.index].asg_name
}
