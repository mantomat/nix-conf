{
  pkgs,
  config,
  lib,
  ...
}:
{
  launchd.user.agents = {

    # Reapply the runtime keyboard mappings when the graphical session starts.
    keyboard-remapping = lib.mkIf config.system.keyboard.enableKeyMapping {
      serviceConfig = {
        ProgramArguments = [
          "/usr/bin/hidutil"
          "property"
          "--set"
          (builtins.toJSON { UserKeyMapping = config.system.keyboard.userKeyMapping; })
        ];
        LimitLoadToSessionType = "Aqua";
        RunAtLoad = true;
        StandardOutPath = "/dev/null";
      };
    };

    omniwm.serviceConfig = {
      ProgramArguments = [ "${pkgs.omniwm}/Applications/OmniWM.app/Contents/MacOS/OmniWM" ];
      RunAtLoad = true;
      KeepAlive = false;
      StandardOutPath = "/Users/${config.system.primaryUser}/Library/Logs/omniwm.log";
      StandardErrorPath = "/Users/${config.system.primaryUser}/Library/Logs/omniwm.err";
    };

    bitwarden.serviceConfig = {
      ProgramArguments = [
        "/usr/bin/open"
        "-b"
        "com.bitwarden.desktop"
      ];
      RunAtLoad = true;
      KeepAlive = false;
      StandardOutPath = "/Users/${config.system.primaryUser}/Library/Logs/bitwarden.log";
      StandardErrorPath = "/Users/${config.system.primaryUser}/Library/Logs/bitwarden.err";
    };

  };
}
