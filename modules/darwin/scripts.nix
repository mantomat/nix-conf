{ ... }:
  {
    # ActivationScripts cannot be created arbitrarily. There are a limited sets
    # of them that can be used by us. Others are dedicated to the internals.
    # And `postActivation` is one of them.
    # See https://github.com/nix-darwin/nix-darwin/blob/e04a388232d9a6ba56967ce5b53a8a6f713cdfcf/modules/system/activation-scripts.nix

    system.userActivationScripts.postActivation.text = ''
      echo "test" > /Users/mantomat/scripttest
    '';

  }
