#!/bin/bash

set -ex

# Install prerequisites
pip3 install ansible fabric3 jsonpickle requests PyYAML
vagrant plugin install vagrant-vbguest

# Cloning magma repo:
# git clone -b v1.5 https://github.com/magma/magma --depth 1

wget https://github.com/magma/magma/archive/refs/tags/v1.5.3.zip
unzip v1.5.3.zip
MAGMA_ROOT=${PWD}/magma-1.5.3

# MAGMA_ROOT=${PWD}/magma

# cd ${MAGMA_ROOT}/lte/gateway/c/oai/tasks/mme_app/

# rm mme_app_bearer.c
# rm mme_app_sgs_detach.c
# rm mme_app_sgsap_location_update.c

# wget https://raw.githubusercontent.com/magma/magma/master/lte/gateway/c/core/oai/tasks/mme_app/mme_app_bearer.c
# wget https://raw.githubusercontent.com/magma/magma/master/lte/gateway/c/core/oai/tasks/mme_app/mme_app_sgs_detach.c
# wget https://raw.githubusercontent.com/magma/magma/master/lte/gateway/c/core/oai/tasks/mme_app/mme_app_sgsap_location_update.c

cd ${MAGMA_ROOT}/lte/gateway

# sed -i '' 's/1.1.20210326/1.1.20210618/' Vagrantfile
fab dev package:vcs=git

# copy magma packages to github runner
vagrant ssh -c "cp -r magma-packages /vagrant"
