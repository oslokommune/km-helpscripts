`sso` is a shell function that sets `AWS_PROFILE` based on the contents in `~/.aws/config`, and possibly logs in with AWS SSO using the selected profile.

Example:

```sh
$ echo $AWS_PROFILE


```

yields an empty result. If you run:

```shell
$ sso
```

![fzf](fzf.png)

then `AWS_PROFILE` is set:

```shell
$ echo $AWS_PROFILE
okctl-dev-AWSAdministratorAccess-123456789012
````

:bulb: If you add the `-l` flag (`sso -l`), you will be logged in with AWS SSO as well (same as running `aws sso login`).

And even better, if you follow the instructions (see installation steps in subdirectories in this
repository) to add `AWS_PROFILE` to your shell prompt, you will always know which AWS environment you're operating in. Example:

![fish-prompt](ps1-example.png)

# Installation

## Bash

See [bash/README.md](bash/README.md).

## Zsh

See [zsh/README.md](zsh/README.md).

## Fish

See [fish/README.md](fish/README.md).

