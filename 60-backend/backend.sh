#!/bin/bash
component=$1
environment=$2

echo "component is $component, environment is $environment"
dnf install ansible -y

ansible-pull -i localhost, -U https://github.com/Sivasankar491/expense-ansible-roles.git main.yaml -e component=$component -e environment=$environment