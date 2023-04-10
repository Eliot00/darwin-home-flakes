{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "elliot";
  home.homeDirectory = "/Users/elliot";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.gpg.enable = true;

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

  programs.git = {
    enable = true;
    userName = "Elliot";
    userEmail = "hack00mind@gmail.com";
    aliases = {
      co = "checkout";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --";
    };
    extraConfig = {
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs : with epkgs; [
      use-package

      evil

      # programming
      company
      company-box
      flycheck
      magit
      vertico
      orderless
      marginalia
      consult

      ef-themes
      doom-modeline

      org
      org-roam
      org-roam-ui
    ];
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    cascadia-code
    lxgw-wenkai
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })

    python3Full
    pdm

    wezterm
    tree

    nodejs
    nodePackages.typescript
    nodePackages.pnpm
    yarn

    ripgrep
    watchman

    postgresql
    redis

    commit-formatter

    htop
    gitui

    dhall
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/wezterm/wezterm.lua".source = wezterm/wezterm.lua;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/elliot/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
