#!/bin/bash
. .reporc
sonardir=$UTIL/sonar

#Install sonar scanner
if ${SONARSCANNER} --help &> /dev/null
then 
    echo "Sonar scanner is already installed."
else
    #Download sonar-scanner
    if [ ! -f /tmp/sonar-scanner-linux.zip ]
    then
	bash $sonardir/tools/update.sh
    else
	echo "Sonar scanner binaries already download."
    fi
    #Install it
    mkdir -p $HOME/src/
    unzip -d $HOME/src/ /tmp/sonar-scanner-linux.zip
fi

#Install build-wrapper
if ${BUILDWRAPPER} --out-dir /tmp make clean &> /dev/null
then 
    echo "Build-wrapper is already installed."
else
    #Download sonar-scanner
    if [ ! -f $sonardir/tools/build-wrapper.zip ]
    then
	bash $sonardir/tools/update.sh
    else
	echo "Build-wrapper binaries already unpacked."
    fi
    mkdir -p $HOME/src/
    unzip -d $HOME/src/ $sonardir/tools/build-wrapper.zip
fi

echo "Done."