# RepoTemplate
> Template files for a (i)Python, C and C++ repositories integrated with SonarQube

For those who program oftenly in `C`, `C++` and `Python`, it is common that when creating a new project, many files from other projects and repositories must be copied in a new repositorie.  Makefiles, installation scripts, sample test code, etc are normally the same for a new repo. 

**RepoTemplate** offers in a single *package* the basic functionality of a basic repository (project) including:

- A generic makefile.

- Example testing code (`unittest` for Python and `cppunit` C++).

- Installations and configuration scripts.

- [SonarQube](https://sonarcloud.io/) integration.

To use **RepoTemplate** you will need (*non-functional* requisites):

1. A [GitHub](https://github.com/join?source=header-home) account.

2. A [SonarQube](https://sonarcloud.io/) account.

3. An Ubuntu Linux machine (we assume it has a x86-64 architecture). 

Make sure that you have configured (installed) your GitHub credentials and have configured your account to make some git (see [appendixes](#gitconfig))

> **NOTE**: Hereafter we will assume that your GitHUb account name is **`iHacker`**.

## Getting started

Creating a new repository from **RepoTemplate**, is very easy:

1. Create locally a directory for the new Repo, eg. `NewRepo`:

		mkdir -p NewRepo
		cd NewRepo

2. Clone the repo template in the new directory (attention to the final `.`; it is mandatory):

		git clone https://github.com/seap-udea/RepoTemplate.git .

3. Run the *make rule* `repo`:

		USER=ihacker make repo

	You need to be sure that `NewRepo` does not exist in the `iHacker` GitHub account.

4. Test your repo:
	
		make

Voila! you have your new repository.

Before using the repository, however, you need to personalize it.

## Repository Personalization

In order to use some of the best functionalities of **RepoTemplate**, it is needed to execute some additional commands.  

1. Install dependencies.

		make deps

	This is a typical output of this command:
	
		Checking for dependencies...
		Checking for sonar-scanner:not installed.
		Checking for build-wrapper:not installed.
		Checking for coverage:not installed.
		Checking for nosetests:not installed.
		Checking for clang:not installed.
		Checking for cppunit:not installed.
		----copy this----
		sudo apt-get install -y libcppunit-dev libcppunit-doc;sudo apt-get install -y clang;sudo apt-get install -y python3-nose;sudo apt-get install -y python3-coverage;make sonarinstall;
		----end copy----

	You must copy the commands betwee `----copy this---` and `----end copy----`.	For the installation of the `sonar-scanner` and `build-wrapper` dependencies see 2.  Once installed the dependencies run again:

		make deps

	When all the dependencies are met, the output of `make deps` should be:
	
		Checking for dependencies...
		Checking for sonar-scanner:done.
		Checking for build-wrapper:done.
		Checking for coverage:done.
		Checking for nosetests:done.
		Checking for clang:done.
		Checking for cppunit:done.
		All done.

4. Download and install sonar-cube binaries.  Sonar require two set of binaries: build-wrapper and sonar-scanner (for detailed explanations of this files see [Sonar Functionality](util/sonar/docs/sonarcloud.md)).  Although they should be normally downloaded fron SonarQube sites, for the sake of simplicity we provide along this package a script for getting and placing it in the right place:

		make sonarinstall

2. Create new project in [Sonarcloud.io](http://sonarcloud.io) and get the `Project Key`, `Organization Key` and `token` (for detailed instructions see [Sonar Cloud configuration](util/sonar/docs/sonarcloud.md))

3. Edit `.sonarc` using the 

		sonar.projectKey=iHacker_NewRepo
		sonar.organization=iHacker-github
		sonar.login=2084a54ce06b4d193900141cf67a163681f746d1

5. Edit `.reporc`
	
		#Directories
		STOREDIR=.store
		UTIL=util
		#Sonar binary directories
		SONARSCANNER=${HOME}/src/sonar-scanner-3.3.0.1492-linux/bin/sonar-scanner
		BUILDWRAPPER=${HOME}/src/build-wrapper-linux-x86/build-wrapper-linux-x86-64
		#Pthon
		PYTHON=python3
		NOSETESTS=nosetests3

***

## Complicated stuff

This is some (optional) complicated stuff.  You probably know it, so we decided to put it at the end of this file to not bother you.  If you are kind of newbie we did not want to scare you with fancy commands.  Still if you have some time, please read.

<a name="gitconfig"></a>
### Git configuration

- Configure:
	
		git config --global user.email "your.email@server.org"
		git config --global user.name "Your Name"

  or equivalently:

		git config --global --edit
		git commit --amend --reset-author

- Create a ssh-key, upload it to GitHub and configure ssh in your machine:

		ssh-keygen -t rsa -N"" -f $HOME/.ssh/id_rsa_ihacker
		cat > $HOME/.ssh/config
		Host github.com-ihacker
		        HostName github.com
		        User git
		        IdentityFile ~/.ssh/id_rsa_ihacker

