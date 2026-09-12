{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;
  wallpaper = ./wallpaper.jpg;
  bind = key: action: {
    _args = [
      key
      (lua action)
    ];
  };
  exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';
  focusWs = ws: ''hl.dsp.focus({ workspace = "${ws}" })'';
  moveWs = ws: ''hl.dsp.window.move({ workspace = "${ws}" })'';
  moveMon = dir: ''hl.dsp.window.move({ monitor = "${dir}" })'';
in
{
  home.packages = [  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.variables = [ "--all" ];
    settings = {
      config = {
        general = {
          gaps_in = 5;
          gaps_out = 5;
          border_size = 0;
        };
        decoration = {
          rounding = 10;
        };
      };

      # Declarative default layout — applied automatically on every start/reload,
      # no exec script needed for this to take effect.
      monitor = [
        {
          # fallback for anything unmatched, e.g. a random new monitor plugged in
          output = "";
          mode = "preferred";
          position = "auto";
          scale = 1;
        }
      ];

      bind = [
        (bind "SUPER+T" (exec "kitty"))
        (bind "SUPER+C" (exec "pkill waybar || waybar"))
        (bind "SUPER+P" (exec "walker"))
        (bind "SUPER+A" (exec "pwvucontrol"))
        (bind "SUPER+B" (exec "blueman-manager"))
        (bind "SUPER+Q" "hl.dsp.window.close()")
        (bind "SUPER+right" (focusWs "r+1"))
        (bind "SUPER+left" (focusWs "r-1"))
        (bind "SUPER+SHIFT+right" (moveWs "r+1"))
        (bind "SUPER+SHIFT+left" (moveWs "r-1"))
        (bind "SUPER+SHIFT+r" (exec "hyprctl reload"))

        (bind "SUPER+ALT+left" (moveMon "l"))
        (bind "SUPER+ALT+right" (moveMon "r"))
        (bind "SUPER+ALT+up" (moveMon "u"))
        (bind "SUPER+ALT+down" (moveMon "d"))
        (bind "SUPER+SHIFT+m" (exec "hypr-monitor-toggle"))

        (bind "XF86AudioMute" (exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
        (bind "XF86AudioMicMute" (exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
        (bind "XF86AudioRaiseVolume" (exec "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"))
        (bind "XF86AudioLowerVolume" (exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
      ];
    };
    extraConfig = ''
      hl.config({
        general = {
          layout = "dwindle"
        },

        dwindle = {
          -- 2 = forces new tiles to open Right/Top (Spiral pattern)
          force_split = 2,

          -- Keeps split structure locked regardless of container shuffles
          preserve_split = true,
        },
        input = {
          kb_layout = "de",
          natural_scroll = true, -- Mouse
          touchpad = {
            natural_scroll = true,  -- Touchpad
          }
        },
      })

      hl.on("hyprland.start", function()
        hl.exec_cmd('hyprctl hyprpaper wallpaper ",${wallpaper}"')
      end)
    '';
  };
}
