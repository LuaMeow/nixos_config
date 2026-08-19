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
            "variable" = {"color" = "#f26d74"; }; #red
            "function" ={"color" = "#7bdee3"; }; #lightblue
            "number" = {"color" = "#c07be3"; }; #purple
            "link-text" = {"color" = "#4f58d1"; }; #blue
            "tag" = {"color" = "#cfb1e0"; }; #lilac #d2a4ed
            "punctuation.bracket" = {"color" = "#e8e04f"; }; #yellow
          };
        };
      };
    };
  };
}
