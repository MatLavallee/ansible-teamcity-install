#!/bin/sh

WORK_DIR=${1:-"."}

# Install Ansible if it is not installed
if hash ansible 2>/dev/null; then
    echo "ansible is already installed"
else
    apt-get update
    apt-get -y install python-software-properties
    add-apt-repository -y ppa:rquillo/ansible
    apt-get update
    apt-get -y install ansible
fi

# Run Ansible
ansible-playbook --inventory-file=$WORK_DIR/playbook/"ansible_hosts" $WORK_DIR/playbook/"site.yml"
