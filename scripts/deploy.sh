#!/usr/bin/env bash
set -euo pipefail

terraform fmt -recursive

cd examples/default
terraform init -upgrade
terraform apply