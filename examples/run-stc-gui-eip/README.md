## Run Windows Spirent TestCenter Application Using Elastic IPs

Run a Windows Server 2019 instance using elastic IPs and install the Spirent TestCenter Application.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| eip\_id | Instance Elastic IP ID | `string` | `"eipalloc-123456789"` | no |
| key\_name | AWS SSH key name to assign to the instance | `string` | `"bootstrap_key"` | no |
| private\_key\_file | AWS key private file | `string` | `"bootstrap_private_key_file"` | no |
| region | AWS region | `string` | `"us-west-2"` | no |
| stc\_installer | File path to 'Spirent TestCenter Application x64.exe' or 'Spirent TestCenter Application.exe' installer. | `string` | `"../../Spirent TestCenter Application x64.exe"` | no |
| subnet\_id | Management plane subnet ID | `string` | `"subnet-123456789"` | no |
| vpc\_id | VPC ID | `string` | `"vpc-123456789"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_public\_ips | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
