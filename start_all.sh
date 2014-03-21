
for host in $1; do
	for vm in `seq -s ' ' $2` ; do
		vmname="${host}_${vm}"
		ssh $host "virsh start $vmname"  < /dev/null
	done
done
