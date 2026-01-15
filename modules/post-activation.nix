{ pkgs, config, ... }: {

  system.activationScripts.postActivation.text = ''
    TARGET_USER="${config.system.primaryUser}"
    USER_HOME="/Users/$TARGET_USER"
    STOW_DIR="$USER_HOME/nix-conf/stow"

    # A nice blue log function
    log_step() {
      echo -e "[post-activation] $1"
    }

    log_step "Ensuring dotfiles are synced for $TARGET_USER..."

    # Run as user
    sudo -u "$TARGET_USER" ${pkgs.bash}/bin/bash -c "
      set -euo pipefail

      # Run stow
      # It will still print errors if something goes wrong.
      cd \"$STOW_DIR\"
      ${pkgs.stow}/bin/stow --restow . --target=\"$USER_HOME\"
    "

    log_step "Done!"
  '';
}
