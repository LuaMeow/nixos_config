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
    };
  };
}
