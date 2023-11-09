#!/usr/bin/bash

# This script is what we are executing our terraform commands to manipulate state.

# So that when a command fails the script exists instead of continuing with the rest of the script. Now that we have 
# a backup of the state we may want to push the orginal state on failure. But this may change based on use case. In
# my opinon I would prefer to exit so that we can review and determine best course of action.
set -o errexit

# test to ensure we have terraform installed
terraform -v

# initialize terraform
terraform init

# create a backup of the existing state file
# TODO think about pushing this to a storage account instead of keeping it on the local filesystem
now=`date '+%Y_%m_%d__%H_%M_%S'`;
terraform state pull >> terraform.tfstate.backup-$now
