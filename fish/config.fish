source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish

set -gx PATH $PATH $HOME/.cargo/bin:$PATH
set -gx PATH $PATH unix://$XDG_RUNTIME_DIR/docker.sock

set -gx PATH $PATH /var/lib/flatpak/exports/bin
set -gx PATH $PATH $HOME/.local/share/flatpak/exports/bin

export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME="qt6ct"

export TERM=st
export EDITOR=hx
export VISUAL=hx

# remove welcome message
set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(zoxide init fish)"
