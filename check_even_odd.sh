count=`cat README.md | wc -l`
if [ $count -ge 0 ];
then
    echo good
fi