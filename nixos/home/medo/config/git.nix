{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings.user.name = "Medo";
    settings.user.email = "medofarag@proton.me";
    settings = {
      init.defaultBranch = "main";
      core.editor = "nvim";
    };

    /*
    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
      visual = "!gitk";
    
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      lga = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all";
    
      undo = "reset HEAD~1 --mixed";
    
      amend = "commit --amend --no-edit";
      amende = "commit --amend";
    
      pushf = "push --force-with-lease";
    
      cleanup = "!git branch --merged | grep -v '\\*\\|main\\|master' | xargs -n 1 git branch -d";
    };
    */
  };
}
