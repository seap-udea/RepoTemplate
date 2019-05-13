#!/bin/bash
. .reporc

#Compile
TYPE=TESTING make tests/test_Module.tout

#Run module testing
TYPE=TESTING make tests/test_Module.tout_run

#Run integration testing
bash tests/test_cpp_integration.sh

#Coverage
gcovr -r .
