# Requirements

Install `zsh` here: https://github.com/PatrickF1/fzf.fish

# Installation steps

* Create the file `~/.config/fish/functions/sso.fish` with the following contents:

```fish
function sso --description "Sets the environment variable AWS_PROFILE"
    switch "$argv"
        case -h --help
            echo -e "Set the environment variable AWS_PROFILE based on the output of \033[32maws configure list-profiles\033[0m"
            echo
            echo "USAGE:"
            echo "$ME [-l|--login] [-h|--help]"
            echo
            echo    "-h, --help     Show this help message"
            echo -e "-l, --login    Runs \033[32maws sso login\033[0m with the selected AWS_PROFILE"
            exit 0
    end

    export AWS_PROFILE=$(aws configure list-profiles | fzf)

    switch "$argv"
        case -l --login
            aws sso login
    end
end
```

* Add `AWS_PROFILE`  to the shell prompt by adding

```fish
    if set -q AWS_PROFILE
        set_color $fish_color_norma
        printf "("

        set_color fb6620
        printf "$AWS_PROFILE"

        set_color $fish_color_normal
        printf ")"
    end
```

to the end of your `~/.config/fish/functions/fish_prompt.fish`.

See example in [fish_prompt.fish](fish_prompt.fish).

* Done!

To verify that it works:

* Open a new terminal
* Run `sso`
* Run `sso -l`
