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

Voila! you have your new repository.

Before using the repository, however, you need to personalize it.

## Repository Personalization



## Appendixes

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

