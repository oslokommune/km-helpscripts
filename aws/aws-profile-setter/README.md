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

```shell
$ echo $AWS_PROFILE
okctl-dev-AWSAdministratorAccess-123456789012
````

# Installation

`cd` to a directory you have in your PATH. Then run:

```sh
wget https://raw.githubusercontent.com/oslokommune/km-helpscripts/main/aws/aws-profile-setter/aw
chmod +x aw
```

## Fish

Follow steps above. Then run:

```sh
wget https://raw.githubusercontent.com/oslokommune/km-helpscripts/main/aws/aws-profile-setter/fs.fish -O ~/.config/fish/functions/fs.fish
```

# Usage

## Bash or Zsh

```shell
. aw
```

## Fish

```shell
fs aw
```

# Usage with AWS SSO

To configure SSO (needs to be done once per AWS account):

```sh
aws sso configure
# Use start URL: https://osloorigo.awsapps.com/start/
```

To login (needs to be done every ~8 hours or so):

```
. aw
aws sso login
```

(or `fs aw` for Fish)

```sh
fs aw
aws sso login
```
