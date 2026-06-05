variable "aws_region" {
  description = "AWS region to deploy in"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu"
  default     = "ami-07a00cf47dbbc844c"
}

variable "instance_type" {
  description = "EC2 instance size"
  default     = "t2.micro" 
}

variable "key_name" {
  description = "Name of existing AWS key pair"
  default     = "my-ec2-key"
}
variable "my_ip"{
    description = "My ip address for ssh"
    default = "183.83.152.236/32"
}