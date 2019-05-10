#!/bin/bash
. .reporc

#Run unitary tests
$NOSETESTS --with-coverage --cover-package=. 

#Run integration tests
bash tests/test_python_integration.sh

