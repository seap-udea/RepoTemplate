#####################################################################
#VARIABLES
#####################################################################
PACKDIR=.pack
CPP=g++
CXXFLAGS=-I. -std=c++11
LXXFLAGS=-lm 

#####################################################################
#COMMON RULES
#####################################################################
all:
	bash compile.sh

clean:cleancrap cleanout cleanrepo

#=========================
#C and C++ compilation
#=========================
%.out:%.o 
	$(CPP) $^ $(LXXFLAGS) -o $@

%.o:%.cpp 
	$(CPP) -c $(CXXFLAGS) $^ -o $@

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

pack:
	@echo "Packing data..."
	@bash $(PACKDIR)/pack.sh

unpack:
	@echo "Unpacking data..."
	@bash $(PACKDIR)/pack.sh unpack

#####################################################################
#EXTERNAL RULES
#####################################################################
#=========================
#Repo Rules
#=========================
include util/repo/repo.in

