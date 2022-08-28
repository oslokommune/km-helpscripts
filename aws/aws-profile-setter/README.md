`aw` is a small script that helps you set `AWS_PROFILE`.

Example:

```sh
$ echo $AWS_PROFILE


```

yields an empty result. If you run:

```shell
$ . aw
```

![fzf](fzf.png)

then `AWS_PROFILE` is set:

```shell
$ echo $AWS_PROFILE
okctl-dev-AWSAdministratorAccess-123456789012
````

# Installation

## Requirements

### Install fzf

* For Bash / macOS: https://github.com/junegunn/fzf

* For Fish: https://github.com/PatrickF1/fzf.fish

## Bash or Zsh

* Run

```sh
cd /usr/local/bin # Or some other directory in your PATH
wget https://raw.githubusercontent.com/oslokommune/km-helpscripts/main/aws/aws-profile-setter/aw
chmod +x aw
```

## Fish

* Run

```sh
cd /usr/local/bin # Or some other directory in your PATH
wget https://raw.githubusercontent.com/oslokommune/km-helpscripts/main/aws/aws-profile-setter/aw
chmod +x aw
```

* Run

```
fisher install edc/bass
alias fs="bass source"
funcsave fs
```

(We need this to be able to source bash commands, see below).

# Usage examples

## Bash or Zsh

```shell
. aw

echo $AWS_PROFILE
```

## Fish

```shell
fs aw

echo $AWS_PROFILE
```

# Usage with AWS SSO

To configure SSO (needs to be done once per AWS account):

```sh
aws sso configure
# Use start URL: https://osloorigo.awsapps.com/start/
```

To login (needs to be done every ~8 hours or so):


## Bash/Zsh

```shell
. aw
aws sso login

# or just
. aw -l
```

## Fish

```fish
fs aw
aws sso login

# or just
fs aw -l
```
