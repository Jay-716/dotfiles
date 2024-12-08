# kanshictl
function __kanshictl_switch_profile
    set -l cmd (commandline -cp)
    if string match -qr -- "kanshictl\s+switch\s+\S*" $cmd
        return 0
    end
    return 1
end

function __kanshictl_get_profiles
    if test -n "$XDG_CONFIG_HOME"
        set -f kanshi_config_path "$XDG_CONFIG_HOME/kanshi/config"
    else
        set -f kanshi_config_path "$HOME/.config/kanshi/config"
    end
    if not test -e "$kanshi_config_path"
        return 1
    end

    grep profile $kanshi_config_path | awk '{print $2}' | string trim -r -c '{'
    return 0
end

complete -f -c kanshictl -s h -l help
complete -f -c kanshictl -n __fish_is_first_arg -a reload
complete -f -c kanshictl -n __fish_is_first_arg -a switch
complete -f -c kanshictl -n '__kanshictl_switch_profile' -a '(__kanshictl_get_profiles)'

