#!/bin/bash
. .reporc

#Run unitary tests
$NOSETESTS --with-coverage --cover-package=. 

#Run integration tests
