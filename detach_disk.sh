
for host in $1; do
	disk=$(( 97 + $2 ))
	for vm in `seq -s ' ' $2 $3` ; do
		vmname="${host}_${vm}"
		ssh $host virsh detach-disk $vmname vdb
	done
done
