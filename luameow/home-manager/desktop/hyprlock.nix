{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 3; # Set to 0 for no "grace period" before locking
      };

      background = [
        {
          # Path to static wallpaper file
          path = "/home/liv/Documents/Wallpapers/GreatTitWallpaper.jpg";

          # If you use hyprpaper, you can screenshot the current state by setting:
          # path = "screenshot";

          blur_passes = 0; # 0 to disable blur, higher numbers make it blurrier
          # blur_size = 7;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
        }
      ];

      input-field = [
        {
          size = "250, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(255, 255, 255, 0.1)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = false;
          placeholder_text = "<i>Password...</i>";
          position = "0, -120";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
