#!/bin/bash
. .reporc

#Run module testing
TYPE=TESTING make tests/test_Module.tout_run

#Run integration testing
bash tests/test_cpp_integration.sh
