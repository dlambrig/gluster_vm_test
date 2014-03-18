#!/bin/bash
i=1
# j = loop of instances per compute node
for j in `echo {1..32}` ; do  
  for z in 2 3 4 5 ; do
    echo -n $i" "
    volID=`cinder create --display-name vol${i} --volume-type gluster 40 | grep "\sid\s" | awk '{print $4}'` >> /tmp/create_instances.out
    sleep 2
    nova boot --image RHEL6.4-snap1 --flavor m1.small --availability-zone gprfc04${z}-avail-zone --block_device_mapping vdb=${volID}:gluster:40:0 vm${i} >> /tmp/create_instances.out
    i=$(($i+1))
  done
done
echo ""
