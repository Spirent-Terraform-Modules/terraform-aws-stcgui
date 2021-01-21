
# Windows Spirent TestCenter Application
 
Run a Windows Server instance and install the Windows Spirent TestCenter application.
After the instance has been started connect using Remote Desktop to use Spirent TestCenter. 

Please obtain a copy of the Windows Spirent TestCenter Application from http://support.spirent.com
and place it in a directory with files copied to the instances.  Be sure to update the src_dir variable to point to this directory.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.65 |
| null | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | The base Windows Server AMI.  When not specified latests Windows Server 2019 AMI will be used. | `string` | `""` | no |
| dest\_dir | Destination directory on the instance where files will be copied | `string` | `"c:/users/administrator/downloads"` | no |
| enable\_provisioner | Enable provisioning | `bool` | `true` | no |
| ingress\_cidr\_blocks | List of management interface ingress IPv4/IPv6 CIDR ranges | `list(string)` | n/a | yes |
| instance\_count | Number of instances to create | `number` | `1` | no |
| instance\_name | Name assigned to the Windows STC GUI instance.  An instance number will be appended to the name. | `string` | `"stcgui-"` | no |
| instance\_type | AWS instance type | `string` | `"m5.large"` | no |
| key\_name | AWS SSH key name to assign to each instance | `string` | n/a | yes |
| private\_key\_file | AWS key private file | `string` | n/a | yes |
| src\_dir | Source directory containing 'Spirent TestCenter Application.exe'.  This directory will be copied to each instance. | `string` | n/a | yes |
| subnet\_id | Management public AWS subnet ID | `string` | n/a | yes |
| vpc\_id | AWS VPC ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_ids | List of instance IDs |
| instance\_private\_ips | List of private IP addresses assigned to the instances, if applicable |
| instance\_public\_ips | List of public IP addresses assigned to the instances, if applicable |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

