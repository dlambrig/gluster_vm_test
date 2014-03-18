#!/bin/bash
for j in `seq ${1} ${2}` ; do
	echo -n $j" "
	volID=`cinder create --display-name vol${j} --volume-type gluster 40 | grep "\sid\s" | awk '{print $4}'` >> create_vols.out
#	server=`nova list|grep vm$j |cut -d ' ' -f 2`
#	nova volume-attach $server $volID /dev/vdb
done
echo ""
