#! /bin/sh
# Copyright (C) 2016, Siemens AG, Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
# SPDX-License-Identifier:	Apache-2.0
# Install kernelci frontend
echo "START: install_frontend.sh"

cd $HOME/git-repos

# Check if repo already exists in the /vagrant directory, if not, download it from github
GIT_SRC="https://github.com/kernelci/kernelci-frontend-config.git"
if [ -d /vagrant/kernelci-frontend-config ]; then
    GIT_SRC=/vagrant/kernelci-frontend-config
fi
git clone $GIT_SRC kernelci-frontend

sed -i kernelci-frontend/roles/install-app/tasks/main.yml \
    -e 's/kernelci\/kernelci-frontend.git/siemens\/kernelci-frontend.git/'

TOKEN=`cat $HOME/backend-admin-token.txt`
cat /vagrant/config/secrets-frontend.yml | sed -e "s/TOKEN/${TOKEN}/" \
    > kernelci-frontend/secrets.yml

cd kernelci-frontend
ansible-playbook -i hosts site.yml -l local -c local -K -D \
                 -e secrets.yml -e "@secrets.yml"
# TODO: Fix error during the first run (second run succeeds deterministically)
ansible-playbook -i hosts site.yml -l local -c local -K -D \
                 -e secrets.yml -e "@secrets.yml"

sudo mkdir -p /var/www/images
sudo chown -R www-data.www-data /var/www

# Add host to /srv/kernelci-frontend/app/server.py
sudo sed -ie 's/app.run(thread/app.run(host='\''0.0.0.0'\'', thread/g' /srv/kernelci-frontend/app/server.py

# Start the webserver to run in the background
/vagrant/scripts/start_webserver.sh &

echo "END: install_frontend.sh"
