# install nfs client
sudo apt -y install nfs-common

# nfs client mount test
sudo mkdir -p /nfs/tmp
sudo chmod -R 777 /nfs/tmp

sudo mount -t nfs 192.168.10.128:/nfs/dev /nfs/tmp

touch /nfs/tmp/x.txt

# check mount list
mount | grep nfs

# nfs client unmount
sudo umount -l /nfs/tmp

