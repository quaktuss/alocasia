variable "region" {
  description = "Irlande is the main region"

  type    = string
  default = "eu-west-1"
}

variable "dhole_profile" {
  description = "profile name on ~/.aws/credentials"

  type = string
  # default = "personal_aws_account"
  default = "default"
}

variable "principal_informations" {
  description = "Default tags for dhole optimisation and iam"
  # Three different environments : 
  # dev   : Developers playground (only accessible by devs)
  # stage : Stakeholders can test implementations and give feedback before going live 
  # prod  : Real production environment

  type = map(string)
  default = {
    environment  = "dev"   # dev/(N/A), stage/val, prod
    project_id   = "0a"    # 2 digits
    project_name = "dhole" # one word
    tenant_name  = "dhole" # snake_case
    tenant_id    = "1a"    # 2 digits

  }
}

locals {
  common_tags = {
    "dhole:environnement" = var.principal_informations["environment"]
    "dhole:project_id"    = var.principal_informations["project_id"]
    "dhole:project_name"  = var.principal_informations["project_name"]
    "dhole:tenant_name"   = var.principal_informations["tenant_name"]
    "dhole:tenant_id"     = var.principal_informations["tenant_id"]
  }
  name_prefix = "${var.principal_informations["environment"]}-${var.principal_informations["project_id"]}-${var.principal_informations["project_name"]}"
}


variable "asg_compute" {
  description = "Multiple value for difference autoscaling group"
  type = list(object({
    custom_user_data_filename = string
    compute_name_suffix       = string
  }))

  default = [{
    # custom_user_data = templatefile("./script/dhole.test.sh", {})
    custom_user_data_filename = "./script/dhole.test.sh"
    compute_name_suffix       = "test"
  }]
}
