count=`cat READMD.md | wc -l`
if [ $count -ge 0 ];
then
    echo good
fi