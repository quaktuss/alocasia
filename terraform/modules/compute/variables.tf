variable "instance_type" {
  description = "Default type of all asg"
  type        = string

  default = "t2.micro"
}


# default user data to install ssm and 3hr kamikaze"
locals {
  default_user_data = "${path.module}/userdata.sh"
}

variable "custom_user_data" {
  description = "Custom userdata, need to be configure by the project team"
  type        = string

}

variable "terminated_instance" {
  description = "This value change the shutdown behavior from stop, to terminate"
  type        = string

  default = "terminate"
}

variable "instance_schedule" {
  description = "At every minute past every 3rd hour. https://crontab.guru/"
  type        = string

  default = "0 0/3 ? * * *"
}


variable "name_prefix" {
  description = "Customer name : projectid-tenantid-projectname-environnement"
  type        = string
}

variable "keypair_name" {
  description = "keypair for all instances"
  type        = string

  default = ""
}

