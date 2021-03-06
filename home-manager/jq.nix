# User configuration for jq

{ pkgs, ... }:

{
  # Install jq
  home.packages = [ pkgs.jq ];

  # Aliases
  programs.zsh.initExtra = ''
    # Use a here string to pass some input directly to jq without having to work with a file
    # https://stackoverflow.com/questions/47105490/can-i-pass-a-string-variable-to-jq-not-the-file
    ealias jqs='jq <<<'
  '';
}
