#!/usr/bin/bash

# This script is what we are executing our terraform commands to manipulate state.

# So that when a command fails the script exists instead of continuing with the
# rest of the script.
set -o errexit

terraform -v
