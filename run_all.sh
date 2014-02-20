
for host in $1; do
	for vm in `seq -s ' ' $2 $3` ; do
		vmname="${host}_${vm}"
		IP=`ssh -o StrictHostKeyChecking=no $host /root/setup/get_ip.sh $vmname`
		ssh -o StrictHostKeyChecking=no $IP $4
	done
done
