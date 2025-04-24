variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "Size of EC2 to provision. You will need at least 1vcpu and 2g memory"
}

variable "iam_instance_profile" {
  type        = string
  default     = null
  description = "Instance profile to attach to instance"
}

variable "ami" {
  type        = string
  description = "AMI for the instance"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security groups to add to the instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet to place the instance in"
}

variable "delegate_name" {
  type        = string
  default     = "k3s"
  description = "Name for the Harness Delegate"
}

variable "delegate_docker_image" {
  type    = string
  default = "Delegate image to use"
}

variable "replicas" {
  type        = number
  default     = 1
  description = "Number of delegates to run"
}

variable "harness_org_id" {
  type        = string
  default     = null
  description = "Organization ID when creating an org or project level delegate"
}

variable "harness_project_id" {
  type        = string
  default     = null
  description = "Project ID when creating a project level delegate"
}