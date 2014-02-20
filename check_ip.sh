for host in $1; do

for i in `seq -s ' ' $2 $3`; do 
	vm="${host}_${i}";
	IP=`ssh $host /root/setup/get_ip.sh $vm`; 
	printf "%s %s\n" $vm $IP;
done
done
