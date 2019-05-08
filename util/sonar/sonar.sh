echo "Running sonar scanner..."
. .reporc
sonardir=$UTIL/sonar

$SONARSCANNER \
 -Dsonar.sources=.\
 -Dsonar.host.url=https://sonarcloud.io\
 -Dsonar.python.coverage.reportPaths=$sonardir/coverage.xml\
 -Dsonar.python.xunit.reportPath=$sonardir/nosetests.xml\
 -Dsonar.exclusions=$sonardir/**,util/**\
 -Dsonar.sourceEncodings=UTF-8\
 -Dsonar.cfamily.build-wrapper-output=$sonardir/build\
 -Dproject.settings=.sonarc\
 |tee $sonardir/sonar.log
