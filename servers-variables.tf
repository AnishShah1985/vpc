variable "public_key_path" {
  description = "Public key path"
  default = "/root/code/test-servers/.ssh/test.pub"
}
variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-011b3ccf1bd6db744" # RHEL-7.6(HVM)
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
variable "environment_tag" {
  description = "Environment tag"
  default = "Dev"
}
