{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      fish_config prompt choose default
    '';

    loginShellInit = ''
      set -gx PATH $HOME/.local/bin $PATH
      set -gx EDITOR nvim
      set -gx VISUAL nvim
    '';

    shellInit = ''
      # ====== Environment Settings ======
      set -g fish_greeting ""
      set -gx QT_QPA_PLATFORM wayland
      set -g fish_prompt_pwd_dir_length 1
      
      # ====== Zoxide ======
      zoxide init fish | source
      
      # ====== PNPM ======
      set -gx PNPM_HOME "/home/medo/.local/share/pnpm"
      if not string match -q -- "$PNPM_HOME/bin" $PATH
        set -gx PATH "$PNPM_HOME/bin" $PATH
      end

      # ====== Aliases (immediate execution for short commands) ======
      # Navigation
      alias .. 'cd ..'
      alias ... 'cd ../..'
      alias .... 'cd ../../..'
      alias .2 'cd ../..'
      alias .3 'cd ../../..'
      
      # Basic commands
      alias c 'clear'
      alias e 'exit'
      alias q 'exit'
      
      # cd with zoxide (executed immediately)
      alias cd z
      
      # ====== Abbreviations (auto-expand for longer commands) ======
      # Git abbreviations
      abbr g 'git'
      abbr gst 'git status'
      abbr gaa 'git add .'
      abbr gap 'git add -p'
      abbr gcm 'git commit -m'
      abbr gca 'git commit --amend'
      abbr gpo 'git push origin'
      abbr gpl 'git pull origin'
      abbr gl 'git log --oneline --graph --all'
      abbr gd 'git diff'
      abbr gds 'git diff --staged'
      abbr gco 'git checkout'
      abbr gb 'git branch'
      abbr gm 'git merge'
      abbr gr 'git reset'
      abbr grh 'git reset --hard'
      abbr gstash 'git stash'
      abbr gstashp 'git stash pop'
      abbr gcls 'git config --list'
      abbr gcs 'git config --system'
      abbr gcg 'git config --global'
      abbr gcl 'git config'
      
      # Files and directories (with eza)
      abbr ll 'eza -lhF --color=auto --group-directories-first --git'
      abbr la 'eza -a --color=auto --group-directories-first'
      abbr l 'eza --color=auto'
      abbr tree 'eza --tree --git --group-directories-first'
      abbr lt 'eza --tree -L 2 --git'
      
      # System commands
      abbr n 'nvim'
      abbr v 'vim'
      abbr hist 'history | fzf'
      abbr ps 'ps aux | grep'
      abbr k 'kill'
      abbr k9 'kill -9'
      abbr weather 'curl wttr.in'
      abbr pray 'node ~/scripts/prayertime.js'
      abbr backup 'bash ~/scripts/backup_my_configs.sh'
      abbr edit '$EDITOR'
      
      # Tmux
      abbr tmuxac 'tmux new -A -s'
      abbr tmuxr 'tmux kill-session -t'
      abbr t 'tmux'
      abbr ta 'tmux attach -t'
      abbr tl 'tmux list-sessions'
      
      # Superfile
      abbr spf 'superfile'
      
      # Run0
      abbr run0 'run0 --background=""'
      
      # NixOS
      abbr ns 'nix-shell'
      abbr nsp 'nix-shell -p'
      abbr nr 'nix-repl'
      abbr nb 'nix-build'
      abbr ne 'nix-env'
      abbr nc 'nix-collect-garbage -d'
      
      # ====== Custom Functions ======
      
      # Create directory and navigate to it
      function mkcd
          mkdir -p $argv[1]
          cd $argv[1]
      end
      
      # Navigate to directory and list its contents
      function cds
          cd $argv[1]
          eza -lh --group-directories-first --git
      end
      
      # Add path to PATH (improved version)
      function addpath
          if set -q argv[1]
              set -gx PATH $PATH $argv[1]
              echo "Added $argv[1] to PATH"
          else
              echo "Usage: addpath <directory>"
          end
      end
      
      # Full system update
      function full-update
          echo "🔄 Updating Nix flake..."
          run0 --background="" nix flake update --flake ~/.nixos/
          
          echo "🔨 Rebuilding NixOS..."
          run0 --background="" nixos-rebuild boot --flake ~/.nixos/#medo-workstation
          
          # Update Flatpak if available
          if command -v flatpak &> /dev/null
              if test (flatpak list | wc -l) -ne 0
                  echo "📦 Updating Flatpak applications..."
                  flatpak update -y
              end
          end
          
          echo "✅ Update complete!"
      end
      
      # Rebuild NixOS with options
      function rebuild
          if set -q argv
              run0 --background="" nixos-rebuild $argv --flake ~/.nixos/#medo-workstation
          else
              echo "Usage: rebuild <switch|boot|test|build>"
          end
      end
      
      # Quick file search
      function findf
          if set -q argv[1]
              fd $argv[1] | fzf --preview 'bat --style=numbers --color=always {}'
          else
              echo "Usage: findf <pattern>"
          end
      end
      
      # Quick file opener
      function openf
          set file (fd . | fzf --preview 'bat --style=numbers --color=always {}')
          if test -n "$file"
              nvim $file
          end
      end
      
      # Show directory sizes
      function duf
          du -sh * | sort -hr | head -n 10
      end
      
      # Show system information
      function sysinfo
          neofetch
          echo ""
          echo "📦 NixOS Version: $(nixos-version)"
          echo "🐟 Fish Version: $(fish --version)"
      end
      
      # ====== Additional Settings ======
      
      # Auto-completion for commands
      complete -c rebuild -a "switch boot test build" -d "NixOS rebuild options"
      complete -c mkcd -a "(__fish_complete_directories)" -d "Directory"
      
      # FZF settings
      set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --preview-window=right:60%"
      set -gx FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always"
      set -gx FZF_CTRL_T_OPTS "--preview 'bat --style=numbers --color=always {}'"
      
      # Command history settings
      set -g history_ignore_dups 1
      set -g history_save_duplicates 0
      
      # Load local configurations if they exist
      if test -f $HOME/.config/fish/local.fish
          source $HOME/.config/fish/local.fish
      end
      
      echo "🐟 Fish shell configured successfully!"
    '';

    shellAbbrs = {};
  };
}
