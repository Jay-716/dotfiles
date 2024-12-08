if status is-interactive
    set -a PATH ~/.local/bin

    set -x EDITOR vim
    set -x SHELL /usr/bin/fish

    set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -x MANROFFOPT "-c"
    set -x LESS "-FrXM"

    set -x GPG_TTY (tty)
    keychain --eval --quiet -Q | source
end

