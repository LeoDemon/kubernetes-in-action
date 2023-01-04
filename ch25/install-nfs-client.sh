# install nfs client
sudo apt -y install nfs-common

# nfs client mount test
mkdir -p /tmp/test

sudo mount -t nfs 192.168.10.127:/tmp/nfs /tmp/test

touch /tmp/test/x.txt

# check mount list
mount | grep nfs

# nfs client unmount
sudo umount -l /tmp/test

