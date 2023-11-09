# iac

Repository for iac examples and learnings

## Copying a state file to a new backend within the same cloud

Steps to move a terraform state file:

1. execute a `terraform init` validating you have access to the current state
2. pull down the current state file with `terraform state pull >> *filename*` and save to a file. This is your backup
3. Reinitialize with a new key and reconfigure flag `terraform init -backend-config="subscription_id=" -backend-config="resource_group_name=" -backend-config="storage_account_name=" -backend-config="container_name=" -backend-config="key=" -reconfigure` this will copy your current state to a new state file. **note** fill out key value pairs. The values were left blank intentionally.
