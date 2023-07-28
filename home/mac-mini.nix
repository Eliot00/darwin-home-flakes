{ config, pkgs, lib, ... }:

{
  imports = [
    ../common
  ];

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

  programs.git = {
    enable = true;
    userName = "Elliot";
    userEmail = "hack00mind@gmail.com";
    aliases = {
      co = "checkout";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %C(bold blue)%s%Creset %Cgreen(%cr) <%an>%Creset' --abbrev-commit --date=relative";
    };
    extraConfig = {
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
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

    nodejs
    nodePackages.typescript
    nodePackages.pnpm
    nodePackages.pm2
    yarn

    postgresql
    redis

    commit-formatter
    dhall
    htop
    ots
    ripgrep
    tree
    watchman

    rust-analyzer

    vim-darwin
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
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
