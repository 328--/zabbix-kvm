#!/bin/sh
POOL_STATUS=`sudo virsh pool-list | sed -e '1,2d' | sed -e 's/^ *//' | sed -e 's/ *$//' | sed -e 's/\s\+/,/g' | grep -w ${1} | cut -f2 -d ','`
READ_ARGUMENT=$1

if [ "${READ_ARGUMENT}" = "" ];then
ERROR=`date +"%Y%m%d:%H%M%S "`${0}' :  empty argument $1'
echo $ERROR
exit
fi

ACTIVE="active"
DEAD="inactive"
if [ ${POOL_STATUS[${READ}]} = ${ACTIVE} ]; then
  echo 1
elif [ ${POOL_STATUS[${READ}]} = ${DEAD} ]; then
  echo 0
else
  echo ""
fi
