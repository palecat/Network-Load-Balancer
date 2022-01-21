# instance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.61.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_instance.vm](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/compute_instance) | resource |
| [yandex_compute_image.my_image](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_family_image"></a> [instance\_family\_image](#input\_instance\_family\_image) | Instance image | `string` | `"lamp"` | no |
| <a name="input_instance_zone"></a> [instance\_zone](#input\_instance\_zone) | Instance zone | `string` | n/a | yes |
| <a name="input_vpc_subnet_id"></a> [vpc\_subnet\_id](#input\_vpc\_subnet\_id) | VPC subnet network id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address"></a> [external\_ip\_address](#output\_external\_ip\_address) | Public IP address |
| <a name="output_internal_ip_address"></a> [internal\_ip\_address](#output\_internal\_ip\_address) | Internal IP address |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
