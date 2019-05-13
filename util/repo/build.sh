echo "Running build wrapper..."
. .reporc
sonardir=$UTIL/sonar

$BUILDWRAPPER --out-dir $sonardir/build $BUILD

bjson=$sonardir/build/build-wrapper-dump.json
if [ "x$(grep '\"captures\":' $bjson)" = "x" ]
then
    echo '{"version":0,"captures":[' $(cat $bjson) > $bjson
fi