## Problems with repository?

### Git is always asking for my user and password

- **Origin**: Running:

		make commit
	
- **Error message**: it asks me for user and password.

- **Solution**: execute:

  		git remote set-url origin git@github.com:<user>/<RepoName>.git

	or alternatively, in case you have a `.ssh/config` file and
	several keys configured (see [Git
	configuration](../../../README.md#gitconfig) in README) , do:

  		git remote set-url origin git@github.com-<user>:<user>/<RepoName>.git

- **Other instructions**: See README.

