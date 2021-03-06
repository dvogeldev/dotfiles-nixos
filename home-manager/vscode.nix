# User configuration for VS Code

{ pkgs, unstable, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = [
      unstable.vscode-extensions.matklad.rust-analyzer
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "vscode-icons";
      publisher = "vscode-icons-team";
      version = "10.2.0";
      sha256 = "13s5jrlj2czwh01bi4dds03hd9hpqk1gs9h0gja0g15d0j4kh39c";
    }];
    userSettings = {
      "editor.renderWhitespace" = "all";
      "editor.tabCompletion" = "on";
      "editor.tabSize" = 2;
      "extensions.autoCheckUpdates" = false;
      "extensions.autoUpdate" = false;
      "extensions.ignoreRecommendations" = true;
      "extensions.showRecommendationsOnlyOnDemand" = true;
      "git.enabled" = true;
      "npm.fetchOnlinePackageInfo" = false;
      "search.quickOpen.includeHistory" = false;
      "search.smartCase" = true;
      "telemetry.enableCrashReporter" = false;
      "telemetry.enableTelemetry" = false;
      "update.mode" = "none";
      "update.showReleaseNotes" = false;
      "vsicons.dontShowNewVersionMessage" = true;
      "workbench.activityBar.visible" = false;
      "workbench.colorTheme" = "Solarized Light";
      "workbench.commandPalette.history" = 0;
      "workbench.editor.enablePreview" = false;
      "workbench.editor.enablePreviewFromQuickOpen" = false;
      "workbench.enableExperiments" = false;
      "workbench.iconTheme" = "vscode-icons";
      "workbench.settings.enableNaturalLanguageSearch" = false;
      "workbench.startupEditor" = "none";
    };
  };
}
