# terraform-aws-k3s-delegate

running a harness delegate on an ec2 k3s cluster

for enabling container based pipelines (CI, CD, IaCM, IDP)

leverage k3s for a simple single-node cluster, along with its [helm controller](https://github.com/k3s-io/helm-controller) for managing charts

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | 5.95.0 |
| harness | 0.37.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.k3s](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [harness_platform_delegatetoken.k3s](https://registry.terraform.io/providers/harness/harness/latest/docs/resources/platform_delegatetoken) | resource |
| [harness_platform_current_account.current](https://registry.terraform.io/providers/harness/harness/latest/docs/data-sources/platform_current_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | AMI for the instance | `string` | n/a | yes |
| delegate\_docker\_image | n/a | `string` | `"Delegate image to use"` | no |
| delegate\_name | Name for the Harness Delegate | `string` | `"k3s"` | no |
| harness\_org\_id | Organization ID when creating an org or project level delegate | `string` | `null` | no |
| harness\_project\_id | Project ID when creating a project level delegate | `string` | `null` | no |
| iam\_instance\_profile | Instance profile to attach to instance | `string` | `null` | no |
| instance\_type | Size of EC2 to provision. You will need at least 1vcpu and 2g memory | `string` | `"t3.small"` | no |
| replicas | Number of delegates to run | `number` | `1` | no |
| subnet\_id | Subnet to place the instance in | `string` | n/a | yes |
| vpc\_security\_group\_ids | Security groups to add to the instance | `list(string)` | n/a | yes |

## Outputs

No outputs.
