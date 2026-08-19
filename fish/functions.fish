function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

function cds
    cd $argv[1]
    eza -lh --group-directories-first --git
end

function addpath
    export PATH=$PATH:$argv[1]
end

function full-update
    run0 --background="" nix flake update --flake ~/.nixos/
    run0 --background="" nixos-rebuild boot --flake ~/.nixos/#medo-workstation
    if test (flatpak list | wc -l) -ne 0
        flatpak update -y
    end
end

function rebuild
    run0 --background="" nixos-rebuild $argv --flake ~/.nixos/#medo-workstation
end
