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

    battery.serviceConfig = {
      Program = "/Applications/battery.app/Contents/MacOS/battery";
      RunAtLoad = true;
      KeepAlive = false;
    };

    shottr.serviceConfig = {
      Program = "/Applications/Shottr.app/Contents/MacOS/Shottr";
      RunAtLoad = true;
      KeepAlive = false;
    };

    bitwarden.serviceConfig = {
      Program = "/Applications/Bitwarden.app/Contents/MacOS/Bitwarden";
      RunAtLoad = true;
      KeepAlive = false;
    };
  };
}
