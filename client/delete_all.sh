#!/bin/bash
echo "deleting volumes"
for j in `seq ${1} ${2}` ; do
	echo -n $j" "
	vol=`cinder list|grep vol${j} |awk '{print $2}'`
	server=`nova list|grep vm${j} |awk '{print $2}'`
	echo $vol $server
	sleep 2
	nova volume-detach $server $vol
	cinder delete $vol
	nova delete $server
done
echo ""
