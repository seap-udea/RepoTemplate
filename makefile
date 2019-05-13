#####################################################################
#VARIABLES
#####################################################################
include .reporc
CPP=g++
BASE_CFLAGS=-I. -std=c++11
BASE_LFLAGS=-lm 

#Flags for testing
ifeq ($(TYPE),TESTING)
	CXXFLAGS=$(BASE_CFLAGS) --coverage -fprofile-arcs -g -O0
	LXXFLAGS=$(BASE_LFLAGS) -lcppunit --coverage -fprofile-arcs
	OUT=tout
else
	CXXFLAGS=$(BASE_CFLAGS) -O4
	LXXFLAGS=$(BASE_LFLAGS)
	OUT=out
endif

#####################################################################
#COMMON RULES
#####################################################################
all:
	bash compile.sh

#=========================
#C and C++ compilation
#=========================
%.$(OUT):%.o 
	$(CPP) $^ $(LXXFLAGS) -o $@

%.o:%.c 
	$(CPP) -c $(CXXFLAGS) $^ -o $@

clean:cleancrap cleanrepo cleansonar cleanout

%.$(OUT)_run:
	@make $(@:_run=)
	@./$(@:_run=)

#####################################################################
#TESTING
#####################################################################
test:
	bash test_c.sh
	bash test_python.sh

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
	@-find . -name "*.tout" -delete
	@-find . -name "*.pyc" -delete
	@-find . -name '__pycache__' -type d | xargs rm -fr

#####################################################################
#EXTERNAL RULES
#####################################################################
#=========================
#Repo Rules
#=========================
include $(UTIL)/repo/repo.in

#####################################################################
#INSTALL
#####################################################################
install:sonar_install repo_install
