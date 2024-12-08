# Activate virtualenv specified by tmux config.
if test -n "$TMUX" && status --is-interactive
    set VENV_PATH "$TMUX_FISH_VIRTUALENV"
    if test -n "$VENV_PATH"
        source "$VENV_PATH/bin/activate.fish"
    end
end
