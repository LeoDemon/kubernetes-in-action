# install nfs-server
sudo apt -y install nfs-kernel-server

# create nfs shared dir
mkdir -p /tmp/nfs

# config nfs server
# nvim /etc/exports
/tmp/nfs 192.168.10.0/24(rw,sync,no_subtree_check,no_root_squash,insecure)

# active nfs config
sudo exportfs -ra
sudo exportfs -v

# startup nfs server
sudo systemctl start nfs-server
sudo systemctl enable nfs-server
sudo systemctl status nfs-server

# check nfs network mount status
showmount -e 127.0.0.1

