echo "Running tests and coverage analysis..."
. .reporc
sonardir=$UTIL/sonar

#Check if coverage files have been generated
if [ "x$(find . -name '*.gcno')" = "x" ]
then
    make all
    make runall
fi

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

#Save coverage files
find . -name '*.gc*' | xargs mv -t $sonardir/meta

#Generate coverage information 
cd $sonardir/meta
lcov -t "c-coverage" -o c-coverage.info -c -d . 
genhtml -o c-coverage-html c-coverage.info
cd -

