{ pkgs, ... }: {

  launchd.user.agents = {

    kopia-ui.serviceConfig = {
      ProgramArguments = [ "/Applications/KopiaUI.app/Contents/MacOS/KopiaUI" ];
      RunAtLoad = true;
      KeepAlive = true;
    };

    raycast.serviceConfig = {
      ProgramArguments = [ "${pkgs.raycast}/Applications/Raycast.app/Contents/MacOS/Raycast" ];
      RunAtLoad = true;
      KeepAlive = false;
    };

    aerospace.serviceConfig = {
      ProgramArguments = [ "${pkgs.aerospace}/Applications/Aerospace.app/Contents/MacOS/Aerospace" ];
      RunAtLoad = true;
      KeepAlive = false;
    };

    battery.serviceConfig = {
      ProgramArguments = [ "/Applications/battery.app/Contents/MacOS/battery" ];
      RunAtLoad = true;
      KeepAlive = false;
    };

    bitwarden.serviceConfig = {
      ProgramArguments = [ "/Applications/Bitwarden.app/Contents/MacOS/Bitwarden" ];
      RunAtLoad = true;
      KeepAlive = false;
    };

    mos.serviceConfig = {
      ProgramArguments = [ "${pkgs.mos}/Applications/Mos.app/Contents/MacOS/Mos" ];
      RunAtLoad = true;
      KeepAlive = false;
    };
  };
}
