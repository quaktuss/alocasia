variable "region" {
  description = "Irlande is the main region"

  type    = string
  default = "eu-west-1"
}

variable "dhole_profile" {
  description = "profile name on ~/.aws/credentials"

  type    = string
  default = "default"
}

variable "default_tags" {
  description = "Default tags for dhole optimisation and iam"
  # Three different environments : 
  # dev   : Developers playground (only accessible by devs)
  # stage : Stakeholders can test implementations and give feedback before going live 
  # prod  : Real production environment

  type = map(string)
  default = {
    "dhole:environnement" = "dev"   # dev/(N/A), stage/val, prod
    "dhole:project_id"    = "0a"    # 2 digits
    "dhole:tenant_name"   = "dhole" # snake_case
  }
}
