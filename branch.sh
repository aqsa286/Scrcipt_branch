FROMBRANCH=$1
TOBRANCH=$2

git show-ref
git remote update
git fetch --all
git checkout $TOBRANCH
ls -la	
git merge --no-ff --no-edit $FROMBRANCH
LASTSTATUS=$?
echo "last status of git merge was $LASTSTATUS"
if [ $LASTSTATUS -ne 0 ]; 
then
    echo "The merge failed."
    exit 1  
fi
git push -u origin $TOBRANCH
git push -u origin $FROMBRANCH

