echo "Running sonar scanner..."
. .reporc
sonardir=$UTIL/sonar

$SONARSCANNER \
 $@ \
 -Dsonar.sources=.\
 -Dsonar.exclusions=$sonardir/**,util/**\
 -Dsonar.host.url=https://sonarcloud.io\
 -Dsonar.python.coverage.reportPaths=$sonardir/meta/coverage.xml\
 -Dsonar.cfamily.gcov.reportsPath=./\
 -Dsonar.sourceEncodings=UTF-8\
 -Dsonar.cfamily.build-wrapper-output=$sonardir/build\
 -Dproject.settings=.sonarc\
 |tee $sonardir/sonar.log

# Deprecated (unit testing is 
# -Dsonar.python.xunit.reportPath=$sonardir/meta/nosetests.xml\
# -Dsonar.cfamily.cppunit.reportsPath=$sonardir/meta/\
