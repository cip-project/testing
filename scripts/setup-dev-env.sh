#!/bin/sh

if [ ! -f "Vagrantfile" ]; then
    echo "script is supposed to be run from the top folder where"
    echo "the Vagrantfile is."
    exit 1
fi

git clone https://github.com/kernelci/kernelci-backend-config.git
git clone https://github.com/kernelci/kernelci-build.git
git clone https://github.com/kernelci/kernelci-frontend-config.git

