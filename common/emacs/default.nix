{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacsMacport;
    extraPackages = epkgs : with epkgs; [
      use-package

      evil

      # programming
      company
      company-box
      consult
      flycheck
      magit
      marginalia
      orderless
      vertico
      consult
      eglot
      rust-mode
      haskell-mode

      doom-modeline
      ef-themes

      org-appear
      org-modern
      org-roam
      org-roam-ui

      ement
    ];
  };
}
