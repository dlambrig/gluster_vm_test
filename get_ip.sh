HW=`virsh domiflist $1|grep br0|cut -b 46-`
IP=`arp -na|grep $HW|cut -f 2 -d ' '`
#IP=${IP:1:-1}
IP=`echo $IP|sed 's/^.\(.*\).$/\1/'`
if [ -z "$IP" ]; then
	IP=`/root/setup/console_get_ip.exp $1 $2 |grep -o 'inet .* brd'|grep -P '\d+.\d+.\d+.\d+' -o`
	ping -c 1 $IP > /dev/null
	if [ $? -ne 0 ]; then
		echo "Could not get IP"
		exit 1
	fi
fi
echo $IP
