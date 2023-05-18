{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    plugins = [
      { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
            # Manually packaging and enable a plugin
      {
      name = "nix";
      src = pkgs.fetchFromGitHub {
        owner = "kidonng";
        repo = "nix.fish";
        rev = "19cfe6c7f1e8ae60865b22197fc43506d78888f8";
        sha256 = "sha256-gVHF7qJrqoiUJm0EirP5uAG37P0rbsFIIlc1TtSKsWE=";
      };
    }
    ];
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
}
