#!/bin/bash
# j = loop of instances per compute node
echo "" > create_instances.out
for j in `seq ${1} ${2}` ; do  
	echo -n $j" "
	volID=`cinder list | grep vol${j} | awk '{ print $2 }'`
	echo $volID
	nova boot  --image f19 --flavor m1.small --key-name f19 --block_device_mapping vdb=${volID}:gluster:40:0 vm$j | grep "\sid\s" | awk '{print $4}' >> ./create_instances.out
#    volID=`cinder create --display-name vol${i} --volume-type gluster 40 | grep "\sid\s" | awk '{print $4}'` >> ./create_instances.out
done
echo ""
