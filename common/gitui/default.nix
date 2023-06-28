{ pkgs, ... }:

{
  home.packages = [
    pkgs.gitui
  ];
  home.file = {
    ".config/gitui/key_bindings.ron".source = ./key_bindings.ron;
  };
}
