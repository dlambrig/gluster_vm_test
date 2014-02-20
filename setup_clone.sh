for host in $1; do
	for vm in `seq -s ' ' $2 $3` ; do
		vmname="${host}_${vm}"
		IP=`ssh $host /root/setup/get_ip.sh $vmname`
		if [ -z "$IP" ]; then
			echo No IP for $vmname
			exit
		fi
		echo $IP
		ssh $IP -o StrictHostKeyChecking=no echo $hostname
		/root/setup/setup_gluster.sh $IP
		MASTER_IP=$4
		ssh $MASTER_IP gluster peer probe $IP
	done
done


 
