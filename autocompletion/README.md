Here are some autocompletion helper for okctl and Kubernetes. Pick and choose whichever you want.

# kubens: Simple kubernetes namespace swithing

https://github.com/ahmetb/kubectx

The debian installation (`apt`) is a bit outdated, so here is another way of installing it:
[kubectx-kubens-bash-install.sh](kubectx-kubens-bash-install.sh).

# kubectl completion

In `.bashrc`, add

```bash
. <(kubectl completion bash)
```

# okctl completion

In `.bashrc`, add

```bash
. <(okctl completion bash)
```

or see `okctl completion -h` for other shells.

# Aliases

```bash
alias k=kubectl
# Alias k bash completion. See how you can find this command with: complete | grep kubectl
complete -o default -F __start_kubectl k 
```
