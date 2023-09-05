# aws-s3-backend

Reference [Terraform S3 Backend Best Practices](https://technology.doximity.com/articles/terraform-s3-backend-best-practices)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.72 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_s3"></a> [aws\_s3](#module\_aws\_s3) | terraform-aws-modules/s3-bucket/aws | 3.4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.s3_cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_dynamodb_table.block_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_kms_alias.key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.bucket_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the S3 bucket | `string` | n/a | yes |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enable S3 bucket access logging via CloudTrail | `bool` | `true` | no |
| <a name="input_enable_object_lock"></a> [enable\_object\_lock](#input\_enable\_object\_lock) | Enable S3 bucket object lock | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Allow deletion of non-empty bucket. It shoukld not be enabled for production environments | `bool` | `false` | no |
| <a name="input_is_tf_backend"></a> [is\_tf\_backend](#input\_is\_tf\_backend) | Is this bucket used as a Terraform backend? | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | AWS S3 Bucket state |
| <a name="output_dynamo_table_lock_name"></a> [dynamo\_table\_lock\_name](#output\_dynamo\_table\_lock\_name) | AWS Dynamo Table lock |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
