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
  programs.hyprlock.enable = true; # Enabled to ensure lock_cmd and lock event work

  dconf.settings = {
    "org/gnome/nautilus/list-view" = {
      use-tree-view = true;
    };
  };

  # Enable the hypridle service
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        # Avoid locking/suspending if a fullscreen app is running (optional)
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      # This listener detects when the laptop lid is closed
      listener = [
        {
          event = "lock";
          on-timeout = "hyprlock";
        }
        {
          event = "lid_close";
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
