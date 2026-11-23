{ pkgs, config, ... }:
{

  launchd.user.agents = {

    drs.serviceConfig = {
      ProgramArguments = [ "darwin-rebuild switch --flake /Users/${config.system.primaryUser}/nix-conf" ];
      RunAtLoad = true;
      KeepAlive = false;
      StandardOutPath = "/Users/${config.system.primaryUser}/Library/Logs/drs.log";
      StandardErrorPath = "/Users/${config.system.primaryUser}/Library/Logs/drs.err";
    };

    omniwm.serviceConfig = {
      ProgramArguments = [ "${pkgs.omniwm}/Applications/OmniWM.app/Contents/MacOS/OmniWM" ];
      RunAtLoad = true;
      KeepAlive = false;
      StandardOutPath = "/Users/${config.system.primaryUser}/Library/Logs/omniwm.log";
      StandardErrorPath = "/Users/${config.system.primaryUser}/Library/Logs/omniwm.err";
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
