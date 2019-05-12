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

make cleancrap

for filegcov in $(find . -name "*.gcov")
do
    file=$(basename $filegcov)
    if [ "x$(echo $file | grep '#')" = "x" ];then continue;fi
    fname=$(echo $file |awk -F"#" '{print $NF}')
    dirname=$(echo $file |awk -F"#$fname" '{print $1}')
    #echo "Dir: $dirname, File: $fname, Fname: $fname"
    mv $filegcov $fname
done
