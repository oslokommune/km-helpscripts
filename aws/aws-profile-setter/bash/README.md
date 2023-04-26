# Requirements

Install `zsh` here: https://github.com/junegunn/fzf

# Installation steps

* `git clone` this repository, like this:

```shell
git clone git@github.com:oslokommune/km-helpscripts.git
```

* Open `~/.bashrc` in your favourite editor.
* Add this line:

```shell
# AWS_PROFILE setter
source ~/YOUR_GIT_DIRECTORY/km-helpscripts/aws/aws-profile-setter/aws_profile_setter
```

* Add `\$(__aw_ps1)` to your PS1 variable. For instance, it can look like this:

```shell
PS1="\[\033[01;36m\]\w\[\033[01;34m\]\$(__git_ps1)\[\033[0m\] \$(__aw_ps1)$ "
```

* Done!

To verify that it works:

* Open a new terminal
* Run `sso`
* Run `sso -l`
