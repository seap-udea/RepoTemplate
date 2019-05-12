echo "Running tests and coverage analysis..."
. .reporc
sonardir=$UTIL/sonar

#Check if coverage files have been generated
if [ "x$(find . -name '*.gcno')" = "x" ];then make test;fi

#Output in xml
gcovr -r . -x > $sonardir/meta/c-coverage.xml

#Output in html
htmldir=$sonardir/meta/c-coverage-html
if [ ! -d $htmldir ];then mkdir -p $htmldir;fi
gcovr -r . --html --html-details -o $htmldir/coverage.html

#Output in scrren
gcovr -k -r . 

#Bring here all the gcov
for source in $SOURCES
do
    sbase=$(echo $source | sed -e "s/\//\#/")
    echo $source$sbase
    for file in $(ls $source/$sbase* 2> /dev/null)
    do
	echo "Copying gcov file: $file"
    	fname=$(echo $file |awk -F"#" '{print $NF}')
    	cp $file $fname
    done
done

make cleancrap
