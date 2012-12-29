# -*- sh -*-

_conf() {
    local cur prev completions
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    check_var() {
        local var=$1
        local var_value=$(eval "echo \$$var")

        [ -z "$var_value" ] && error "Unspecified value for $var"
    }

    check_config() {
        check_var "REMOTE_CONF"
        check_var "LOCAL_CONF_DIR"
    }

    load_config() {
        if ! [ -f $HOME/.confrc ]; then
            error "No configuration file found in $HOME/.confrc"
        fi
        . $HOME/.confrc
        check_config
    }

    list_remote_modules() {
        local remote_ssh_conn=${REMOTE_CONF%%:*}
        local remote_path=${REMOTE_CONF##*:}

        ssh $remote_ssh_conn "\ls \"$remote_path\"" | sed -e "s/.git//g"
    }

    list_local_modules() {
        \ls "$LOCAL_CONF_DIR"
    }

    load_config

    COMMANDS="install status list update apply diff new"

    case "$prev" in
        install)
            completions="$(list_remote_modules)"
            ;;
        status|update|apply|diff)
            completions="$(list_local_modules)"
            ;;
        conf)
            completions="$COMMANDS"
            ;;
    esac

    COMPREPLY=( $(compgen -W "$completions" -- $cur))
    return 0
}

complete -F _conf conf
