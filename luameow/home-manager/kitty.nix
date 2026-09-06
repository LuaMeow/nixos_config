{ lib, ... }:
{
  programs.kitty = lib.mkForce
  {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "fish";
      confirm_os_window_close = 0;
      window_padding_width = 10;
      enable_audio_bell = false;
      background_opacity = "0.6";
      background_blur = 2;
      mouse_hide_wait = "-1.0";
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function fish_greeting
        fastfetch -s Title:Break:OS:Kernal:Chassis:Uptime:Break:Terminal:Shell:DE:WM:Break:CPU:GPU:Disk:Memory
      end
    '';
  };
}
