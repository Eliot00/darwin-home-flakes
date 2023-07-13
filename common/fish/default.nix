{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      gst = "git status";
      gd = "git diff";
      gdc = "git diff --cached";
      gl = "git pull";
      gp = "git push";
      gco = "git checkout";
      gcm = "git checkout master";
      gb = "git branch";
      gcl = "git config --list";
      gcp = "git cherry-pick";
      ga = "git add";
      gaa = "git add --all";
      gsta = "git stash";
      gstp = "git stash pop";
      gstd = "git stash drop";
      cf = "git-cf";
    };
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
