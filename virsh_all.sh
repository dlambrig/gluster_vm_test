
for host in $1; do
	for vm in `seq -s ' ' $2 $3` ; do
		vmname="${host}_${vm}"
		ssh $host virsh $4 $vmname 
	done
done
