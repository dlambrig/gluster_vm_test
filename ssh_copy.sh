
for host in $1; do
	for vm in `seq -s ' ' $2 $3` ; do
		vmname="${host}_${vm}"
		IP=`ssh $host /root/setup/get_ip.sh $vmname`
 		sshpass -p 100yard- ssh-copy-id -o StrictHostKeyChecking="no" -i ~/.ssh/id_rsa.pub $IP
	done
done
