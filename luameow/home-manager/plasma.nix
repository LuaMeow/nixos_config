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
    powerdevil = {
      AC = {
        turnOffDisplay.idleTimeout = 1200; # Time in seconds (e.g., 600s = 10 minutes, or set to null/0 to disable)
        autoSuspend.idleTimeout = 30 * 60; # Sleep timeout in seconds
      };
      battery = {
        turnOffDisplay.idleTimeout = 600;
        autoSuspend.idleTimeout = 1200;
      };
    };
  };
}
