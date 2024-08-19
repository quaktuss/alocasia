variable "instance_type" {
  description = "Default type of all asg"
  type        = string

  default = "t2.micro"
}

# variable "default_user_data" {
#   description = "Default user data with autodelete after 3hr of use"
#   type        = string
#   nullable    = true

#   default = templatefile("${path.module}/userdata.sh", {})
# }

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

  default = "* */3 * * *"
}
