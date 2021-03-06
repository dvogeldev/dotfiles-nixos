# TODO: 20.09 - Replace with https://cli.github.com (https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/version-management/git-and-tools/gh/default.nix)
{
  programs.zsh.shellAliases = {
    #   Pass GITHUB_TOKEN with personal access token to avoid storing GitHub credentials ('man hub' for details)
    #   Generate a personal access token at https://github.com/settings/tokens/new
    hub = "GITHUB_TOKEN='$(pass me/github.com/hub-cli-access-token)' hub";
  };

  programs.zsh.initExtra = ''
    GITHUB_USER="dmarcoux"

    # Fork a Git repository. It clones the repository, creates the fork on GitHub and sets remotes
    fork_repo() {
      if [ -z "$1" ]; then
        # Display usage
        echo "Usage: ''${funcstack[1]} git@github.com:username/repo.git"
        return
      fi

      REPOSITORY_URL="$1"
      REPOSITORY_NAME="$(basename "$1" .git)"

      # Clone repository
      git clone "$REPOSITORY_URL"

      # Go into cloned repository and fork it
      (
        cd "$REPOSITORY_NAME" || exit

        # Pass GITHUB_TOKEN with personal access token to avoid storing GitHub credentials ('man hub' for details)
        # Generate a personal access token at https://github.com/settings/tokens/new
        GITHUB_TOKEN="$(pass me/github.com/hub-cli-access-token)" hub fork

        # Rename remotes created by hub
        # - origin (repository) is renamed to upstream
        # - my_user_name (fork) is renamed to origin
        git remote rename origin upstream
        git remote rename "$GITHUB_USER" origin
      )
    }
  '';
}
