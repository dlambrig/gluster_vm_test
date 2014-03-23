
for host in $1 ; do
	for vm in `seq -s ' ' $2 $3` ; do
		vmstr="${host}_${vm}"
		ovmstr="${host}_1"
		virt-clone --force -o $ovmstr -n $vmstr --auto-clone
	done
done
