# Packages to install without any specific configuration
# They are installed in the system profile
# Search for packages to install with `nix search package_name`

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    atool
    bat
    exa
    fd
    firefox
    flameshot
    fzf
    jq
    mumble
    openresolv
    pdftk
    peek
    ripgrep
    shellcheck
    stow
    thunderbird-bin
    units
    universal-ctags
    xcape
    xournal
    xsel
    yank
    zbar
    zip
  ];
}