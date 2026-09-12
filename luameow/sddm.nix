{ pkgs, ... }:
let
  sddmTheme = pkgs.stdenv.mkDerivation {
    pname = "sddm-theme";
    version = "1.1";
    src = builtins.path {
      path = ./sddm-theme;
      name = "sddmtheme-v1.1";
    };
    installPhase = ''
      mkdir -p $out/share/sddm/themes/sddm-theme
      cp -r $src/* $out/share/sddm/themes/sddm-theme/
      cp ${./home-manager/desktop/wallpaper.jpg} $out/share/sddm/themes/sddm-theme/background.jpg
    '';
  };
in
{
  environment.systemPackages = [
    sddmTheme
    pkgs.lora
  ];
  fonts.packages = [ pkgs.lora ];

  # cuz of crashes q.q
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
    theme = "sddm-theme";
    extraPackages = [ sddmTheme ];
    settings = {
      General = {
        OutputName = "eDP-1";
      };
    };
  };

  # auto clear cash so theme reloads
  systemd.services.display-manager.preStart = ''
    rm -rf /var/lib/sddm/.cache
  '';
}
