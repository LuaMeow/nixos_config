{ pkgs, ... }:
{
  imports = [
    ./desktop/desktop.nix
    ./zed.nix
    ./kitty.nix
    ./ssh.nix
    ./fastfetch.nix
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
    darktable
    moonlight-qt
    nautilus
    brightnessctl
    gnome-control-center
    swayimg
  ];

  programs.onlyoffice.enable = true;
  programs.direnv.enable = true;
  programs.obsidian.enable = true;

  dconf.settings = {
    "org/gnome/nautilus/list-view" = {
      use-tree-view = true;
    };
  };
}
