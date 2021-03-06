# User configuration for fzf

{ pkgs, config, ... }:

let
  # Colors, Solarized Light
  # black = "#002B36";
  # cyan = "#2AA198";
  # dark_beige = "#EEE8D5";
  # magenta = "#D33682";
  # orange = "#CB4B16";
  # red = "#DC322F";
  # violet = "#6C71C4";
  blue = "#268BD2";
  green = "#859900";
  grey = "#839496";
  light_beige = "#FDF6E3";
  yellow = "#B58900";
in
{
  programs.fzf = {
    enable = true;
    # Default command for the ALT+C key binding (using the default 'fd' command)
    changeDirWidgetCommand = "command fd --hidden --type directory --exclude .git";
    # Default command to use when input is tty (using the default 'fd' command)
    defaultCommand = "command fd --hidden --type file --no-ignore-vcs --exclude .git";
    defaultOptions = [
      # Keybinds to select, deselect and toggle all results
      "--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"
      # Default layout (fullscreen and input from top)
      "--min-height=100 --reverse"
      # Default colors
      "--color fg:${grey},bg:${light_beige},hl:${blue},fg+:${light_beige},bg+:${green},hl+:${blue}"
      "--color info:${yellow},prompt:${yellow},pointer:${light_beige},marker:${light_beige},spinner:${yellow}"
    ];
    # Default command for the CTRL+T key binding
    fileWidgetCommand = "${config.programs.fzf.defaultCommand}";
  };

  programs.zsh.initExtra = ''
    # TODO: Fix minor bug which doesn't display VCS info
    function cd_to_ranger_bookmark() {
      local directory
      directory=$(cat "${config.xdg.configHome}/ranger/bookmarks" | sed -n "s/.*:\(.*\)$/\1/p" | sort | fzf)

      cd "$directory" || exit

      zle && zle reset-prompt
    }

    # Define keybind CTRL+G to cd to ranger bookmark
    zle -N cd_to_ranger_bookmark
    bindkey '^g' cd_to_ranger_bookmark
  '';
}
