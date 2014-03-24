
ssh $1 service glusterd start
ssh $1 mkfs.xfs -f /dev/vdb
ssh $1 mkdir -p /data/gv0/brick1
ssh $1 mount /dev/vdb /data/gv0/brick1/
ssh $1 "echo '/dev/vdb /data/brick1 xfs defaults 1 2' >> /etc/fstab"

