# Useful aliases for Kubernetes managment

## Julius'

```shell
# Saves you a couple of lifetimes not having to write the whole name kubectl.
alias k="kubectl"

# Shortens the command kubens. Recommend installing
# [fzf](https://github.com/junegunn/fzf) for a neat fuzzy searchable list when
# running kubens without arguments.
alias kns="kubens"

# Shows `kubectl get pods` information and refreshes the screen by default each 2
# seconds. Useful when observing startup / teardown processes.
alias kwatch="watch kubectl get pods"
```


