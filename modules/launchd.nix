{ pkgs, config, ... }:
{

  launchd.user.agents = {

    aerospace.serviceConfig = {
      ProgramArguments = [ "${pkgs.aerospace}/Applications/Aerospace.app/Contents/MacOS/Aerospace" ];
      RunAtLoad = true;
      KeepAlive = false;
      StandardOutPath = "/Users/${config.system.primaryUser}/Library/Logs/aerospace.log";
      StandardErrorPath = "/Users/${config.system.primaryUser}/Library/Logs/aerospace.err";
    };

    battery.serviceConfig = {
      ProgramArguments = [ "/Applications/battery.app/Contents/MacOS/battery" ];
      RunAtLoad = true;
      KeepAlive = false;
      StandardOutPath = "/Users/${config.system.primaryUser}/Library/Logs/battery.log";
      StandardErrorPath = "/Users/${config.system.primaryUser}/Library/Logs/battery.err";
    };

    bitwarden.serviceConfig = {
      ProgramArguments = [ "/Applications/Bitwarden.app/Contents/MacOS/Bitwarden" ];
      RunAtLoad = true;
      KeepAlive = false;
      StandardOutPath = "/Users/${config.system.primaryUser}/Library/Logs/bitwarden.log";
      StandardErrorPath = "/Users/${config.system.primaryUser}/Library/Logs/bitwarden.err";
    };

  };
}
