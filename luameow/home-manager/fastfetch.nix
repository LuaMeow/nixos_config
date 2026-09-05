let
  fastfetch_logo = ./ascii.txt;
in
{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "${fastfetch_logo}";
        padding = {
          right = 1;
          left = 1;
          top =1;
          bottom =1;
        };
        color = "cyan";
      };
    };
  };
}
