{
  programs.zed-editor = {
    enable = true;
    mutableUserSettings = false;
    extensions = [
      "nix"
      "html"
      "svelte"
      "js"
      "ts"
      "material-icon-theme"
      "everforest-blurred"
    ];
    userSettings = {
      format_on_save = "off";
      disable_ai = true;
      project_panel = {
        dock = "right";
      };
      theme = {
        mode = "dark";
        dark = "Everforest Blurred";
        light = "Ayu Light";
      };
      icon_theme = "Material Icon Theme";
      ui_font_size = 16;
      buffer_font_size = 15;

      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
      theme_overrides = {
        "Everforest Blurred" = {
          "syntax" = {
            "keyword" = {"color" = "#fcad68"; "font_style" = "italic"; }; #orange
            "string" = {"color" = "#8ae37b"; }; #green
            "variable" = {"color" = "#ff6e9e"; }; #pink
            "function" ={"color" = "#7bdee3"; }; #lightblue
            "number" = {"color" = "#c07be3"; }; #purple
            "link-text" = {"color" = "#4f58d1"; }; #blue
            "tag" = {"color" = "#cfb1e0"; }; #lilac
            "punctuation.bracket" = {"color" = "#e8e04f"; }; #yellow
          };
        };
      };
    };
  };
}
