# Kernel CI for the Civil Infrastructure Platform #

This repository provides vagrant infrastructure that allows users/labs
to easily set up a kernel CI front- end backend tailored to the needs
of the civil infrastructure platform (http://www.cip-platform.org).

After cloning the repo, issue

	user@host: ~/repo$ vagrant up

to build a VM with KernelCI front and backend. To compile-test the
current revision of the kernel, issue

	user@host: ~/repo$ vagrant ssh
	
	vagrant@guest: ~$ cd git-repos
	vagrant@guest: ~/git-repos$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
	vagrant@guest: ~/git-repos$ cd linux-stable
	vagrant@guest: ~/git-repos/linux-stable$ export TREE_NAME=cip-dreiwettertaft
	vagrant@guest: ~/git-repos/linux-stable$ export ARCH=arm 
	vagrant@guest: ~/git-repos/linux-stable$ export CROSS_COMPILE=arm-linux-gnueabi- 
	vagrant@guest: ~/git-repos/linux-stable$ ~/kernelci-build/build.py -c tinyconfig -p CIP-KernelCI

You can of course choose tree name, architecture, configuration, kernel revision
etc. according to your needs. To view the results, start the frontend web server
by running

	vagrant@guest: ~/git-repos/linux-stable$ /vagrant/scripts/start_webserver.sh

On the host, point your browser to http://localhost:5000

