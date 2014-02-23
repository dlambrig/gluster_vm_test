
IP=`./get_ip.sh $1`
sshpass -p 100yard- ssh-copy-id -o StrictHostKeyChecking="no" -i ~/.ssh/id_rsa.pub $IP
sshpass -p 100yard- ssh-copy-id -o StrictHostKeyChecking="no" -i ~/.ssh/id_rsa.pub localhost
scp /root/setup/rhel7.repo $IP:/etc/yum.repos.d
scp /root/setup/gluster.repo $IP:/etc/yum.repos.d
scp /root/setup/onboot.sh $IP:~
scp /root/setup/ifcfg-eth1 $IP:/etc/sysconfig/network-scripts
scp /root/setup/onboot.service $IP:/etc/systemd/system
ssh $IP chmod +x onboot.sh
ssh $IP systemctl enable onboot.service
ssh $IP yum -y install glusterfs-server

virsh attach-interface $1 --type bridge br1 --config --model virtio
