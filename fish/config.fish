if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux EDITOR nvim
set -U fish_greeting
fish_add_path /home/deveezy/.local/bin/poetry

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
