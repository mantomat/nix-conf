{ pkgs, config, ... }:
{

  system.activationScripts.postActivation.text = ''
    set -euo pipefail

    TARGET_USER="${config.system.primaryUser}"
    USER_HOME="/Users/$TARGET_USER"

    log_step() {
      echo "[post-activation] $1"
    }

    log_step "Ensuring dotfiles are synced for $TARGET_USER..."

    sudo -u "$TARGET_USER" ${pkgs.bash}/bin/bash -c "
      set -euo pipefail
      cd \"$USER_HOME/nix-conf/stow\"
      ${pkgs.stow}/bin/stow --restow . --target=\"$USER_HOME\"
    "

    log_step "Done!"
  '';
}
