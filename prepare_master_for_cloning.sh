
IP=`./get_ip.sh $1`
IP_ETH1=`./get_ip_eth1.sh $1`
sshpass -p 100yard- ssh-copy-id -o StrictHostKeyChecking="no" -i ~/.ssh/id_rsa.pub $IP
sshpass -p 100yard- ssh-copy-id -o StrictHostKeyChecking="no" -i ~/.ssh/id_rsa.pub localhost
scp /root/setup/rhel7.repo $IP:/etc/yum.repos.d
scp /root/setup/gluster.repo $IP:/etc/yum.repos.d
scp /root/setup/onboot.sh $IP:~
scp /root/setup/onboot.service $IP:/etc/systemd/system
ssh $IP chkconfig NetworkManager off
ssh $IP chmod +x onboot.sh
ssh $IP systemctl enable onboot.service
ssh $IP yum -y install glusterfs-server
ssh $IP yum -y install net-tools
ssh $IP grep rpc-auth-allow-insecure /etc/glusterfs/glusterd.vol || sed -i '/rdma/aoption rpc-auth-allow-insecure on' /etc/glusterfs/glusterd.vol

virsh attach-interface $1 --persistent  --type bridge --source br1 --model virtio
MAC=`virsh dumpxml $1|grep -B 1  br1|grep mac|cut -b 21-37`
sed -i 's/HWADDR=.*/HWADDR='$MAC'/g' ifcfg-eth1
sed -i 's/IPADDR=.*/IPADDR='$IP_ETH1'/g' ifcfg-eth1
scp /root/setup/ifcfg-eth1 $IP:/etc/sysconfig/network-scripts
ssh $IP service network restart
ssh $IP ifup eth1

