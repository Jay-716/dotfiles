if status is-interactive
    set -a PATH ~/.local/bin
    set -a PATH ~/go/bin

    set -x EDITOR vim
    set -x SHELL /usr/bin/fish

    set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -x MANROFFOPT "-c"
    set -x LESS "-FrXM"

    alias ht "htop"
    alias lg "lazygit"
    alias tm "tmux"
    alias nn "env NNN_TRASH=1 NNN_OPTS=edAB nnn"
    alias nv "nvim"
    alias pyvenv "source ~/Programs/pyvenv0/bin/activate.fish"
    alias uuid4gen "python -c 'import uuid; print(uuid.uuid4())'"
    alias cp "cp -i"
    alias mv "mv -i"

    abbr syu "sudo pacman -Syu"

    set -x GPG_TTY (tty)
    keychain --eval --quiet -Q | source
end

