echo "Running tests and coverage analysis..."
. .reporc
sonardir=$UTIL/sonar
rm -rf .coverage &> /dev/null

#Options: https://nose.readthedocs.io/en/latest/man.html
$NOSETESTS \
--with-coverage \
--cover-package=./ \
--cover-xml --cover-xml-file=$sonardir/meta/coverage.xml \
--with-xunit --xunit-file=$sonardir/meta/nosetests.xml \
--cover-html --cover-html-dir=$sonardir/meta/coverage-html \

sed -i.bak 's/filename="/filename=".\//g' $sonardir/meta/coverage.xml
