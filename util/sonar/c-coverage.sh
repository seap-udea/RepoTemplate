echo "Running tests and coverage analysis..."
. .reporc
sonardir=$UTIL/sonar

#Run all
make runall

#Run gcov
dirs=". tests"
exts="c cpp"
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
#find . -name "*.gc*" -exec mv {} $sonardir/meta \;
find . -name '*.gc*' | xargs mv -t $sonardir/meta
