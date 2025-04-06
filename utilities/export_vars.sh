export TF_VAR_subscription_id=$(az account show --query id -o tsv)
export TF_VAR_tenant_id=$(az account show --query tenantId -o tsv)
export ARM_SUBSCRIPTION_ID=$TF_VAR_subscription_id
export ARM_TENANT_ID=$TF_VAR_tenant_id

