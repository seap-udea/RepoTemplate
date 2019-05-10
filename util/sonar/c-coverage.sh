echo "Running tests and coverage analysis..."
. .reporc
sonardir=$UTIL/sonar

./program.out
./Program.exe
tests/test_Module.exe


