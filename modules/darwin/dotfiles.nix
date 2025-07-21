{ ... }: {
  system.activationScripts.dotfiles.text = ''
    $HOME/nix-conf/scripts/manage-dotfiles.sh
  '';
}
