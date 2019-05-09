#####################################################################
#VARIABLES
#####################################################################
include .reporc
CPP=g++
CC=gcc
CFLAGS=-I. 
LFLAGS=-lm
CXXFLAGS=-I.
LXXFLAGS=-lm -lcppunit

#####################################################################
#COMMON RULES
#####################################################################
all:
	bash compile.sh

clean:cleancrap cleanrepo cleansonar cleanout

cleancrap:
	@echo "Cleaning crap..."
	@-find . -name "*~" -delete
	@-find . -name "#*#" -delete
	@-find . -name "#*" -delete
	@-find . -name ".#*" -delete
	@-find . -name ".#*#" -delete
	@-find . -name ".DS_Store" -delete
	@-find . -name ".Icon*" -delete

cleanout:
	@echo "Cleaning all compiled objects..."
	@-find . -name "*.o" -delete
	@-find . -name "*.out" -delete
	@-find . -name "*.exe" -delete
	@-find . -name "*.pyc" -delete
	@-find . -name '__pycache__' -type d | xargs rm -fr

#=========================
#C and C++ compilation
#=========================
%.out:%.o module.o
	$(CC) $^ $(LFLAGS) -o $@

%.o:%.c 
	$(CC) -c $(CFLAGS) $^ -o $@

%.exe:%.opp Module.opp
	$(CPP) $^ $(LXXFLAGS) -o $@

%.opp:%.cpp
	$(CPP) -c $(CXXFLAGS) $< -o $@

#####################################################################
#EXTERNAL RULES
#####################################################################
#=========================
#Repo Rules
#=========================
include $(UTIL)/repo/repo.in

#=========================
#Sonar Rules
#=========================
include $(UTIL)/sonar/sonar.in
