module "wrapper" {
  source = "../../modules/iam-role-for-service-accounts-eks"

  for_each = var.items

  create_role                                                     = try(each.value.create_role, var.defaults.create_role, true)
  role_name                                                       = try(each.value.role_name, var.defaults.role_name, null)
  role_path                                                       = try(each.value.role_path, var.defaults.role_path, "/")
  role_permissions_boundary_arn                                   = try(each.value.role_permissions_boundary_arn, var.defaults.role_permissions_boundary_arn, null)
  role_description                                                = try(each.value.role_description, var.defaults.role_description, null)
  role_name_prefix                                                = try(each.value.role_name_prefix, var.defaults.role_name_prefix, null)
  policy_name_prefix                                              = try(each.value.policy_name_prefix, var.defaults.policy_name_prefix, "AmazonEKS_")
  role_policy_arns                                                = try(each.value.role_policy_arns, var.defaults.role_policy_arns, {})
  oidc_providers                                                  = try(each.value.oidc_providers, var.defaults.oidc_providers, {})
  tags                                                            = try(each.value.tags, var.defaults.tags, {})
  force_detach_policies                                           = try(each.value.force_detach_policies, var.defaults.force_detach_policies, true)
  max_session_duration                                            = try(each.value.max_session_duration, var.defaults.max_session_duration, null)
  assume_role_condition_test                                      = try(each.value.assume_role_condition_test, var.defaults.assume_role_condition_test, "StringEquals")
  allow_self_assume_role                                          = try(each.value.allow_self_assume_role, var.defaults.allow_self_assume_role, false)
  attach_aws_gateway_controller_policy                            = try(each.value.attach_aws_gateway_controller_policy, var.defaults.attach_aws_gateway_controller_policy, false)
  attach_cert_manager_policy                                      = try(each.value.attach_cert_manager_policy, var.defaults.attach_cert_manager_policy, false)
  cert_manager_hosted_zone_arns                                   = try(each.value.cert_manager_hosted_zone_arns, var.defaults.cert_manager_hosted_zone_arns, ["arn:aws:route53:::hostedzone/*"])
  attach_cluster_autoscaler_policy                                = try(each.value.attach_cluster_autoscaler_policy, var.defaults.attach_cluster_autoscaler_policy, false)
  cluster_autoscaler_cluster_ids                                  = try(each.value.cluster_autoscaler_cluster_ids, var.defaults.cluster_autoscaler_cluster_ids, [])
  cluster_autoscaler_cluster_names                                = try(each.value.cluster_autoscaler_cluster_names, var.defaults.cluster_autoscaler_cluster_names, [])
  attach_ebs_csi_policy                                           = try(each.value.attach_ebs_csi_policy, var.defaults.attach_ebs_csi_policy, false)
  ebs_csi_kms_cmk_ids                                             = try(each.value.ebs_csi_kms_cmk_ids, var.defaults.ebs_csi_kms_cmk_ids, [])
  attach_efs_csi_policy                                           = try(each.value.attach_efs_csi_policy, var.defaults.attach_efs_csi_policy, false)
  attach_external_dns_policy                                      = try(each.value.attach_external_dns_policy, var.defaults.attach_external_dns_policy, false)
  external_dns_hosted_zone_arns                                   = try(each.value.external_dns_hosted_zone_arns, var.defaults.external_dns_hosted_zone_arns, ["arn:aws:route53:::hostedzone/*"])
  attach_external_secrets_policy                                  = try(each.value.attach_external_secrets_policy, var.defaults.attach_external_secrets_policy, false)
  external_secrets_ssm_parameter_arns                             = try(each.value.external_secrets_ssm_parameter_arns, var.defaults.external_secrets_ssm_parameter_arns, ["arn:aws:ssm:*:*:parameter/*"])
  external_secrets_secrets_manager_arns                           = try(each.value.external_secrets_secrets_manager_arns, var.defaults.external_secrets_secrets_manager_arns, ["arn:aws:secretsmanager:*:*:secret:*"])
  external_secrets_kms_key_arns                                   = try(each.value.external_secrets_kms_key_arns, var.defaults.external_secrets_kms_key_arns, ["arn:aws:kms:*:*:key/*"])
  attach_fsx_lustre_csi_policy                                    = try(each.value.attach_fsx_lustre_csi_policy, var.defaults.attach_fsx_lustre_csi_policy, false)
  fsx_lustre_csi_service_role_arns                                = try(each.value.fsx_lustre_csi_service_role_arns, var.defaults.fsx_lustre_csi_service_role_arns, ["arn:aws:iam::*:role/aws-service-role/s3.data-source.lustre.fsx.amazonaws.com/*"])
  attach_karpenter_controller_policy                              = try(each.value.attach_karpenter_controller_policy, var.defaults.attach_karpenter_controller_policy, false)
  karpenter_controller_cluster_id                                 = try(each.value.karpenter_controller_cluster_id, var.defaults.karpenter_controller_cluster_id, "*")
  karpenter_controller_cluster_name                               = try(each.value.karpenter_controller_cluster_name, var.defaults.karpenter_controller_cluster_name, "*")
  karpenter_tag_key                                               = try(each.value.karpenter_tag_key, var.defaults.karpenter_tag_key, "karpenter.sh/discovery")
  karpenter_controller_ssm_parameter_arns                         = try(each.value.karpenter_controller_ssm_parameter_arns, var.defaults.karpenter_controller_ssm_parameter_arns, ["arn:aws:ssm:*:*:parameter/aws/service/*"])
  karpenter_controller_node_iam_role_arns                         = try(each.value.karpenter_controller_node_iam_role_arns, var.defaults.karpenter_controller_node_iam_role_arns, ["*"])
  karpenter_subnet_account_id                                     = try(each.value.karpenter_subnet_account_id, var.defaults.karpenter_subnet_account_id, "")
  karpenter_sqs_queue_arn                                         = try(each.value.karpenter_sqs_queue_arn, var.defaults.karpenter_sqs_queue_arn, null)
  attach_load_balancer_controller_policy                          = try(each.value.attach_load_balancer_controller_policy, var.defaults.attach_load_balancer_controller_policy, false)
  attach_load_balancer_controller_targetgroup_binding_only_policy = try(each.value.attach_load_balancer_controller_targetgroup_binding_only_policy, var.defaults.attach_load_balancer_controller_targetgroup_binding_only_policy, false)
  load_balancer_controller_targetgroup_arns                       = try(each.value.load_balancer_controller_targetgroup_arns, var.defaults.load_balancer_controller_targetgroup_arns, ["arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"])
  attach_appmesh_controller_policy                                = try(each.value.attach_appmesh_controller_policy, var.defaults.attach_appmesh_controller_policy, false)
  attach_appmesh_envoy_proxy_policy                               = try(each.value.attach_appmesh_envoy_proxy_policy, var.defaults.attach_appmesh_envoy_proxy_policy, false)
  attach_amazon_managed_service_prometheus_policy                 = try(each.value.attach_amazon_managed_service_prometheus_policy, var.defaults.attach_amazon_managed_service_prometheus_policy, false)
  amazon_managed_service_prometheus_workspace_arns                = try(each.value.amazon_managed_service_prometheus_workspace_arns, var.defaults.amazon_managed_service_prometheus_workspace_arns, ["*"])
  attach_velero_policy                                            = try(each.value.attach_velero_policy, var.defaults.attach_velero_policy, false)
  velero_s3_bucket_arns                                           = try(each.value.velero_s3_bucket_arns, var.defaults.velero_s3_bucket_arns, ["*"])
  attach_vpc_cni_policy                                           = try(each.value.attach_vpc_cni_policy, var.defaults.attach_vpc_cni_policy, false)
  vpc_cni_enable_ipv4                                             = try(each.value.vpc_cni_enable_ipv4, var.defaults.vpc_cni_enable_ipv4, false)
  vpc_cni_enable_ipv6                                             = try(each.value.vpc_cni_enable_ipv6, var.defaults.vpc_cni_enable_ipv6, false)
  attach_node_termination_handler_policy                          = try(each.value.attach_node_termination_handler_policy, var.defaults.attach_node_termination_handler_policy, false)
  node_termination_handler_sqs_queue_arns                         = try(each.value.node_termination_handler_sqs_queue_arns, var.defaults.node_termination_handler_sqs_queue_arns, ["*"])
  attach_cloudwatch_agent_policy_adot                             = try(each.value.attach_cloudwatch_agent_policy_adot, var.defaults.attach_cloudwatch_agent_policy_adot, false)
  attach_xray_policy_adot                                         = try(each.value.attach_xray_policy_adot, var.defaults.attach_xray_policy_adot, false)
  attach_prometheus_policy_adot                                   = try(each.value.attach_prometheus_policy_adot, var.defaults.attach_prometheus_policy_adot, false)
}
