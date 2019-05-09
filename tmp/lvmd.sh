#!/bin/sh
LVM_CONF=/etc/lvm/lvm.conf
if [ ! -f ${LVM_CONF}.bak ];then
	cp -a ${LVM_CONF} ${LVM_CONF}.bak
fi
sed -i.save -e "s#write_cache_state = 1#write_cache_state = 0#" ${LVM_CONF}
mount --rbind ${MOUNT_PATH} /dev
pvcreate ${DEVICE} -y
vgcreate ${VG_NAME} ${DEVICE}
/lvmd -v 5 -listen 0.0.0.0:1736 -logtostderr
