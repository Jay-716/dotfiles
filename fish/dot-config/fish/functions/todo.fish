function todo --description 'View and edit todo list using gvim/vim'
    set -f PROG "gvim"
    set -f TODO_FILE ~/Desktop/todo

    if test -z $argv[1]
        set -f PROG "less"
    else
        if test "$argv[1]" = "--help"  || test "$argv[1]" = "-h"
            echo Usage: $argv[0] "[OPTIONS]"
            echo "  -h, --help: show this message"
            echo "  -e, --edit: edit with gvim"
            echo "  -v, --vim: edit with vim"
            exit
        else if test "$argv[1]" = "--edit" || test "$argv[1]" = "-e"
            set -f PROG "gvim"
        else if test "$argv[1]" = "--vim" || test "$argv[1]" = "-v"
            set -f PROG "vim"
        end
    end

    $PROG $argv[2..-1] $TODO_FILE
end
