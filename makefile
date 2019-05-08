#####################################################################
#VARIABLES
#####################################################################
include .reporc
CPP=g++
CC=gcc
CFLAGS=-I. 
LFLAGS=-lm

#####################################################################
#COMMON RULES
#####################################################################
all:program.out

clean:cleancrap cleanrepo cleansonar cleanout

cleancrap:
	@echo "Cleaning crap..."
	@-find . -name "*~" -delete
	@-find . -name "#*#" -delete
	@-find . -name "#*" -delete
	@-find . -name ".#*" -delete
	@-find . -name ".#*#" -delete

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
%.out:%.o
	$(CC) $^ $(LFLAGS) -o $@

%.o:%.c
	$(CC) -c $(CFLAGS) $^ -o $@

%.exe:%.opp
	$(CPP) $^ $(LFLAGS) -o $@

%.opp:%.cpp
	$(CPP) -c $(CFLAGS) $< -o $@

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
