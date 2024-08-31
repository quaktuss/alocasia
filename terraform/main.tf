module "ec2_custom" {
  source           = "./modules/compute"
  count            = length(var.asg_compute)
  custom_user_data = templatefile("${var.asg_compute[count.index].custom_user_data_filename}", {})
  name_prefix      = "${local.name_prefix}-${var.asg_compute[count.index].compute_name_suffix}"
}
