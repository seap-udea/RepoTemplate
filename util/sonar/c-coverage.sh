echo "Running tests and coverage analysis..."
. .reporc
sonardir=$UTIL/sonar

#Check if coverage files have been generated
if [ "x$(find . -name '*.gcno')" = "x" ];then make runall;fi

#Output in xml
gcovr -r . -x > $sonardir/meta/c-coverage.xml

#Output in html
htmldir=$sonardir/meta/c-coverage-html
if [ ! -d $htmldir ];then mkdir -p $htmldir;fi
gcovr -r . --html --html-details -o $htmldir/coverage.html

#Output in scrren
gcovr -k -r . 

#Bring here all the gcov
for file in $(ls tests/tests\#*)
do
    fname=$(echo $file |awk -F"#" '{print $NF}')
    cp $file $fname
done
