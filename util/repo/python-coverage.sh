echo "Running tests and coverage analysis..."
. .reporc
repodir=$UTIL/repo
rm -rf .coverage &> /dev/null

#Options: https://nose.readthedocs.io/en/latest/man.html
$NOSETESTS \
--with-coverage \
--cover-package=./ \
--cover-xml --cover-xml-file=$repodir/meta/python-coverage.xml \
--with-xunit --xunit-file=$repodir/meta/python-tests.xml \
--cover-html --cover-html-dir=$repodir/meta/python-coverage-html \

sed -i.bak 's/filename="/filename=".\//g' $repodir/meta/python-coverage.xml
