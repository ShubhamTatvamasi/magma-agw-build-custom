#!/bin/bash

set -ex

# Install prerequisites
pip3 install ansible fabric3 jsonpickle requests PyYAML
vagrant plugin install vagrant-vbguest

# Cloning magma repo:
git clone -b fix_timer_exp_handler_returns https://github.com/ulaskozat/magma --depth 1

# start building magma
cd magma/lte/gateway
fab dev package:vcs=git

# copy magma packages to github runner
vagrant ssh -c "cp -r magma-packages /vagrant"
