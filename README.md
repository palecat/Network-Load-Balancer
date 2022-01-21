# Load Balancer

```bash
terraform init -backend-config="access_key=access_key" \
    -backend-config="secret_key=secret_key" \
    -backend-config="bucket=bucket"
```

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ya_instance_1"></a> [ya\_instance\_1](#module\_ya\_instance\_1) | ./modules/instance | n/a |
| <a name="module_ya_instance_2"></a> [ya\_instance\_2](#module\_ya\_instance\_2) | ./modules/instance | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_lb_network_load_balancer.lb](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/lb_network_load_balancer) | resource |
| [yandex_lb_target_group.tg](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/lb_target_group) | resource |
| [yandex_vpc_network.lab_net](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.lab_subnet_a](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.lab_subnet_b](https://registry.terraform.io/providers/yandex-cloud/yandex/0.61.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | Security token or IAM token used for authentication in Yandex.Cloud | `string` | n/a | yes |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | The ID of the cloud to operate under | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of the folder to operate under | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_lb"></a> [external\_ip\_address\_lb](#output\_external\_ip\_address\_lb) | Public IP address of load balancer |
| <a name="output_external_ip_address_vm_1"></a> [external\_ip\_address\_vm\_1](#output\_external\_ip\_address\_vm\_1) | Public IP address of vm 1 |
| <a name="output_external_ip_address_vm_2"></a> [external\_ip\_address\_vm\_2](#output\_external\_ip\_address\_vm\_2) | Public IP address of vm 2 |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
