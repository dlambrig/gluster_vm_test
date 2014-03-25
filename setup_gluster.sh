
ssh $1 -o StrictHostKeyChecking="no" service glusterd start
ssh $1 -o StrictHostKeyChecking="no" mkfs.xfs -f /dev/vdb
ssh $1 -o StrictHostKeyChecking="no" mkdir -p /data/gv0/brick1
ssh $1 -o StrictHostKeyChecking="no" mount /dev/vdb /data/gv0/brick1/
ssh $1 -o StrictHostKeyChecking="no" "echo '/dev/vdb /data/gv0/brick1 xfs defaults 1 2' >> /etc/fstab"

