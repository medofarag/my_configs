source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish
# remove welcome message
set -g fish_greeting
set -gx QT_QPA_PLATFORM wayland

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# eval "$(ssh-agent -s)"
eval "$(zoxide init fish)"

# pnpm
set -gx PNPM_HOME "/home/medo/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
    set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end
