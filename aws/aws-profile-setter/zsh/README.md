# Requirements

Install `zsh` here: https://github.com/junegunn/fzf

# Installation steps

* `git clone` this repository, like this:

```shell
git clone git@github.com:oslokommune/km-helpscripts.git
```

* Open `~/.zshrc` in your favourite editor.
* Add this line:

```shell
# AWS_PROFILE setter
source ~/YOUR_GIT_DIRECTORY/km-helpscripts/aws/aws-profile-setter/aws_profile_setter
```

* Add `$(__aw_ps1)` to your PROMPT variable. For instance, it can look like this:

```shell
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)$(__aw_ps1)'
setopt promptsubst
```

* Done!

To verify that it works:

* Open a new terminal
* Run `sso`
* Run `sso -l`
