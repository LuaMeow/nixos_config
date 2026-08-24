{ pkgs, ... }:
{
  imports = [
    ./zed.nix
    ./kitty.nix
    ./plasma.nix
    ./ssh.nix
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
    obsidian
    fastfetch
  ];

  programs.onlyoffice.enable = true;
  programs.direnv.enable = true;
  programs.obsidian.enable = true;
}
