data "harness_platform_current_account" "current" {}

resource "harness_platform_delegatetoken" "k3s" {
  name       = var.delegate_name
  account_id = data.harness_platform_current_account.current.id
  org_id     = var.harness_org_id
  project_id = var.harness_project_id
}

resource "aws_instance" "k3s" {
  ami                  = var.ami
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile

  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id

  user_data = templatefile("${path.module}/userdata.tpl", {
    DELEGATE_NAME         = var.delegate_name
    ACCOUNT_ID            = data.harness_platform_current_account.current.id
    DELEGATE_TOKEN        = harness_platform_delegatetoken.k3s.value
    MANAGER_ENDPOINT      = data.harness_platform_current_account.current.endpoint
    DELEGATE_DOCKER_IMAGE = var.delegate_docker_image
    REPLICAS              = var.replicas
  })

  tags = {
    Name = var.delegate_name
  }
}