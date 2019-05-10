echo "Running tests and coverage analysis..."
. .reporc
sonardir=$UTIL/sonar

#Check if coverage files have been generated
if [ "x$(find . -name '*.gcno')" = "x" ];then make runall;fi

#Run gcov
dirs=". tests"
exts="cpp"
for dir in $dirs
do
    for ext in $exts
    do
	if [ "x$(ls $dir/*.$ext 2> /dev/null)" != "x" ]
	then
	    gcov $dir/*.$ext
	fi
    done
done

exit 0

#Save coverage files
find . -name '*.gcda' | xargs mv -t $sonardir/meta
find . -name '*.gcno' | xargs mv -t $sonardir/meta
find . -name '*.gcov' -exec cp {} {}.bak \;

#Generate coverage information 
cd $sonardir/meta/
lcov -t "c-coverage" -o c-coverage.info -c -d . 
genhtml -o c-coverage-html c-coverage.info
cd -

#Recover gcov
for file in $(find . -name '*.gcov.bak')
do
    original=$(echo $file |awk -F".bak" '{print $1}')
    mv $file $original
done
