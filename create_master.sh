
#OS=http://download.eng.bos.redhat.com/rel-eng/RHEL-7.0-20140207.0/compose/Workstation/x86_64/os
OS=http://download.devel.redhat.com/rel-eng/latest-RHEL-7/compose/Server/x86_64/os/
#OS=http://download.eng.bos.redhat.com/released/F-19/GOLD/Fedora/x86_64/os

NETWORK=bridge=br0
MEM=$((4 * 1024))
qemu-img create -f qcow2 -o preallocation=metadata /home/storage/vm.qcow1 5G
DISK=path=/home/storage/vm.qcow1,format=qcow2,bus=virtio,cache=none 

# just in case this blocks ftp..
iptables -F

virt-install --name $1 \
             -r $MEM \
             --vcpus 2 \
             --network $NETWORK \
             -l $OS \
             --autostart \
             --disk $DISK \
             --graphics none \
             -x "console=ttyS0,115200 ks=ftp://10.16.153.108/pub/ks.cfg"


