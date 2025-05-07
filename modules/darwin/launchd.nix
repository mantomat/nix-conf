{ pkgs, ... }: {

  launchd.user.agents = {

    kopia-ui.serviceConfig = {
      Program = "/Applications/KopiaUI.app/Contents/MacOS/KopiaUI";
      RunAtLoad = true;
      KeepAlive = true;
    };

    raycast.serviceConfig = {
      Program = "${pkgs.raycast}/Applications/Raycast.app/Contents/MacOS/Raycast";
      RunAtLoad = true;
      KeepAlive = false;
    };

    aerospace.serviceConfig = {
      Program = "${pkgs.aerospace}/Applications/Aerospace.app/Contents/MacOS/Aerospace";
      RunAtLoad = true;
      KeepAlive = false;
    };
  };
}
