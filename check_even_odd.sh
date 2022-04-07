count=`cat READMD.md | wc -l`
if [ $count -ge 0 ];
then
    exit 1
fi