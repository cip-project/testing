cd ~
cd git-repos
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable
git checkout -b cip_v4.4.27 v4.4.27
echo "Building cip-test Tree"
export TREE_NAME=cip-test
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
~/kernelci-build/build.py -c tinyconfig -p CIP-KernelCI
~/kernelci-build/build.py -c allnoconfig -p CIP-KernelCI
echo "Building cip-tyrannosaurus Tree"
export TREE_NAME=cip-tyrannosaurus
~/kernelci-build/build.py -c tinyconfig -p CIP-KernelCI
~/kernelci-build/build.py -c allnoconfig -p CIP-KernelCI
echo "Building cip-stegosaurus Tree"
export TREE_NAME=cip-stegosaurus
~/kernelci-build/build.py -c tinyconfig -p CIP-KernelCI
~/kernelci-build/build.py -c allnoconfig -p CIP-KernelCI
