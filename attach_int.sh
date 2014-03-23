
for host in $1; do
	disk=$(( 97 + $2 ))
	for vm in `seq -s ' ' $2 $3` ; do
		diskletter=`perl -e 'printf "%c\n", '$disk';'`
		diskstr="sd${diskletter}"
		vmname="${host}_${vm}"
		ssh $host virsh attach-disk $vmname /dev/$diskstr --persistent --target vdb

		IP_ETH1=`./get_ip_eth1.sh $vmname`
		IP_ETH0=`./get_ip.sh $vmname`
#		sed -i 's/IPADDR=.*/IPADDR='$IP_ETH1'/g' ifcfg-eth1
#		scp ifcfg-eth1 $IP_ETH0:/etc/sysconfig/network-scripts
		./console_set_ip.exp $vmname $IP_ETH1
		disk=$(( $disk + 1 ))
	done
done
