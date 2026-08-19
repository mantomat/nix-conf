{ pkgs, config, ... }:

# This could be moved to host-specific config in the future

let
  commonFlags = "--exclude-caches --one-file-system --verbose";
  primaryUser = config.system.primaryUser;

  setupBackupSecrets = pkgs.writeShellScriptBin "setup-backup-secrets" ''
    set -euo pipefail

    REQUIRED_SECRETS=(
        "restic-repo-local"
        "restic-repo-cloud"
        "aws-access-key-id"
        "aws-secret-access-key"
    )

    echo "Setting up System Secrets..."
    for SECRET_NAME in "''${REQUIRED_SECRETS[@]}"; do
        echo "  Configuring: $SECRET_NAME"
        read -s -p "    Enter value (leave empty to skip):" SECRET_VALUE
        echo ""

        if [ -n "$SECRET_VALUE" ]; then
            security add-generic-password -U -a "${primaryUser}" -s "$SECRET_NAME" -w "$SECRET_VALUE"
            echo "    Updated."
        else
            echo "    Skipped."
        fi
        unset SECRET_VALUE
    done
    echo "Done."
  '';

  resticBackupLocal = pkgs.writeShellScriptBin "restic-backup-local" ''
    export PATH="${pkgs.restic}/bin:$PATH"

    export RESTIC_PASSWORD_COMMAND="security find-generic-password -s restic-repo-local -w"

    REPO="/Volumes/MantoKopia/restic"

    # Only run if the drive is actually plugged in
    if [ -d "$REPO" ]; then
      echo "Starting Local Backup..."
      restic -r "$REPO" backup /Users/${primaryUser}/Documents/ ${commonFlags}
    else
      echo "Local repository not found. Skipping."
    fi
  '';

  resticPruneLocal = pkgs.writeShellScriptBin "restic-prune-local" ''
    export PATH="${pkgs.restic}/bin:$PATH"

    export RESTIC_PASSWORD_COMMAND="security find-generic-password -s restic-repo-local -w"

    REPO="/Volumes/MantoKopia/restic"

    if [ -d "$REPO" ]; then
      echo "Pruning Local Repository..."
      restic -r "$REPO" forget --keep-daily 7 --keep-weekly 4 --keep-monthly 12 --prune
    else
      echo "Local repository not found. Skipping."
    fi
  '';

  # resticBackupCloud = pkgs.writeShellScriptBin "restic-backup-cloud" ''
  #   # Load Secrets from Keychain
  #   export RESTIC_PASSWORD_COMMAND="security find-generic-password -s restic-repo-cloud -w"
  #   export AWS_ACCESS_KEY_ID=$(security find-generic-password -s aws-access-key-id -w)
  #   export AWS_SECRET_ACCESS_KEY=$(security find-generic-password -s aws-secret-access-key -w)
  #
  #   # TODO cloud name
  #   REPO="s3:s3.region.endpoint.com/bucket-name"
  #   echo "Starting Cloud Backup..."
  #   restic -r "$REPO" backup /Users/${primaryUser}/Documents/ ${commonFlags}
  #
  #   restic -r "$REPO" forget --keep-daily 7 --keep-weekly 4 --keep-monthly 12 --prune
  # '';

in
{

  environment.systemPackages = [
    setupBackupSecrets
    resticBackupLocal
    resticPruneLocal
  ];

  launchd.user.agents = {

    restic-local = {
      serviceConfig = {
        ProgramArguments = [ "${resticBackupLocal}/bin/restic-backup-local" ];
        StartInterval = 3600; # 1 hour
        RunAtLoad = false;
        StandardOutPath = "/Users/${primaryUser}/Library/Logs/restic-local.log";
        StandardErrorPath = "/Users/${primaryUser}/Library/Logs/restic-local.err";
      };
    };

    restic-local-prune = {
      serviceConfig = {
        ProgramArguments = [ "${resticPruneLocal}/bin/restic-prune-local" ];
        StartCalendarInterval = [
          {
            Hour = 2;
            Minute = 0;
          }
        ];
        RunAtLoad = false;
        StandardOutPath = "/Users/${primaryUser}/Library/Logs/restic-local-prune.log";
        StandardErrorPath = "/Users/${primaryUser}/Library/Logs/restic-local-prune.err";
      };
    };

    # restic-cloud = {
    #   serviceConfig = {
    #     ProgramArguments = [ "${cloudBackupScript}/bin/restic-backup-cloud" ];
    #     StartInterval = 21600; # 6 hours
    #     RunAtLoad = true;      # Run if missed (laptop was off)
    #     StandardOutPath = "/Users/${primaryUser}/Library/Logs/restic-cloud.log";
    #     StandardErrorPath = "/Users/${primaryUser}/Library/Logs/restic-cloud.err";
    #   };
    # };

  };
}
