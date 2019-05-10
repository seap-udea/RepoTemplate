#####################################################################
#VARIABLES
#####################################################################
include .reporc
CPP=g++
CC=gcc
CFLAGS=-I. -ftest-coverage -fprofile-arcs
LFLAGS=-lm -ftest-coverage -fprofile-arcs
CXXFLAGS=-I. --coverage -fprofile-arcs
LXXFLAGS=-lm -lcppunit --coverage -fprofile-arcs

#####################################################################
#COMMON RULES
#####################################################################
all:
	bash compile.sh

runall:
	bash runall.sh

#=========================
#C and C++ compilation
#=========================
%.out:%.o $(CMODS)
	$(CC) $^ $(LFLAGS) -o $@

%.exe:%.opp
	$(CPP) $^ $(LXXFLAGS) -o $@

%.o:%.c 
	$(CC) -c $(CFLAGS) $^ -o $@

%.opp:%.cpp
	$(CPP) -c $(CXXFLAGS) $< -o $@

clean:cleancrap cleanrepo cleansonar cleanout

#=========================
#Clean
#=========================
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
	@-find . -name "*.opp" -delete
	@-find . -name "*.gcno" -delete
	@-find . -name "*.gcda" -delete
	@-find . -name "*.gcov" -delete
	@-find . -name "*.info" -delete
	@-find . -name "*.out" -delete
	@-find . -name "*.exe" -delete
	@-find . -name "*.pyc" -delete
	@-find . -name '__pycache__' -type d | xargs rm -fr

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
