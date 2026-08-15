{ pkgs, ... }:
{
    imports = [
        ./vscode.nix
        ./kitty.nix
    ];

    home.username = "liv";
    home.homeDirectory = "/home/liv";
    home.stateVersion = "26.05";

    home.packages = with pkgs; [
        discord
        thunderbird
        nil 
        nixd
        nixfmt
        kitty
    ];

    programs.direnv.enable = true;
}