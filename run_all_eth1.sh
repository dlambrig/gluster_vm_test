
for host in $1; do
	for vm in `seq -s ' ' $2 $3` ; do
		vmname="${host}_${vm}"
		IP=`/root/setup/get_ip_eth1.sh $vmname`
		ssh -o StrictHostKeyChecking=no $IP $4
	done
done
