{ ... }: {

  imports = [
    ../../optional/restic-backup.nix
  ];

  services.resticLocalBackup = {
    repository = "/Volumes/MantoKopia/restic";
    paths = [ "/Users/mantomat/Documents/" ];
    interval = 3600;
    startOnMount = true;
    pruneTime = {
      hour = 2;
      minute = 0;
    };
  };
}
