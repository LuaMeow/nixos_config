{
  programs.plasma = {
    enable = true;
    window-rules = [
      {
        description = "Transparent VS Code";
        match.window-class = {
          value = "code";
          type = "substring";
        };
        apply = {
          opacityactive = {
            value = 75;
            apply = "force";
          };
        };
      }
    ];
  };
}