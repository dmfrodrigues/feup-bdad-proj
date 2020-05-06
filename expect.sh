ERRCODE=$1
CMD=$2

eval $2
ret=$?
if [ $ret = $ERRCODE ]; then
    exit 0;
else 
    exit 1;
fi
