{ pkgs, ... }:
{
    programs.vscode = {
        enable = true;
        profiles.default = {
            extensions = with pkgs.vscode-extensions; [
                jnoortheen.nix-ide
                teabyii.ayu
            ];
            userSettings = {
                "workbench.colorTheme" = "Ayu Dark Bordered";
                "workbench.iconTheme" = "ayu";
                "editor.suggestOnTriggerCharacters" = false;
                "chat.disableAIFeatures" = true;
            };
        };
    };
}