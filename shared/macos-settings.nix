{ config, lib, ... }:
let
  primaryUser = lib.escapeShellArg config.system.primaryUser;
  setSymbolicHotKeys =
    shortcuts:
    let
      entries = lib.mapAttrsToList (
        id: settings:
        lib.escapeShellArgs [
          id
          (lib.generators.toPlist { escape = true; } settings)
        ]
      ) shortcuts;
    in
    lib.optionalString (entries != [ ]) ''
      /bin/launchctl asuser "$(/usr/bin/id -u -- ${primaryUser})" \
        /usr/bin/sudo --user=${primaryUser} -- /usr/bin/defaults write \
        com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add ${lib.concatStringsSep " " entries}
    '';
in
{
  system.primaryUser = "mantomat";

  # Don't produce that horror-like sound when turning on, please
  system.startup.chime = false;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  system.activationScripts.userDefaults.text = lib.mkAfter (setSymbolicHotKeys {
    "64".enabled = false; # Show Spotlight search (⌘Space)
  });

  system.defaults = {
    trackpad = {
      # Use trackpad silent clicking
      ActuationStrength = 0;

      # Disable trackpad gestures
      TrackpadThreeFingerVertSwipeGesture = 0;
      TrackpadFourFingerVertSwipeGesture = 0;
      TrackpadFourFingerHorizSwipeGesture = 0;
      TrackpadFourFingerPinchGesture = 0;
      TrackpadThreeFingerHorizSwipeGesture = 0;
    };

    # Use a separate space for each display
    spaces.spans-displays = false;

    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };

    ActivityMonitor = {
      # Show CPU usage in the dock while running
      IconType = 5;
      # Show all processes hierarchically
      ShowCategory = 101;
    };

    NSGlobalDomain = {
      # Set system dark mode
      AppleInterfaceStyle = "Dark";

      # Disable press&hold
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;

      # Show all extensions in the finder
      AppleShowAllExtensions = true;
      # Show hidden files in the finder
      AppleShowAllFiles = true;

      NSAutomaticCapitalizationEnabled = false;

      NSDocumentSaveNewDocumentsToCloud = false;

      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;

      # Show medium finder/settings sidebar icons (1 small, 3 large)
      NSTableViewDefaultSizeMode = 2;

      # Don't emit sounds when setting the volume
      "com.apple.sound.beep.feedback" = 0;
    };

    dock = {
      autohide = true;
      autohide-delay = 0.0;
      # Group windows in the mission control exposé (requested by Aerospace)
      expose-group-apps = true;
      minimize-to-application = true;
      show-recents = false;
      tilesize = 48;
      persistent-apps = [ ];
    };

    WindowManager = {
      EnableStandardClickToShowDesktop = false;
      EnableTiledWindowMargins = false;
      EnableTilingByEdgeDrag = false;
      EnableTopTilingByEdgeDrag = false;
      EnableTilingOptionAccelerator = false;
    };

    finder = {
      # Search in current folder by default
      FXDefaultSearchScope = "SCcf";
      # Default to list view
      FXPreferredViewStyle = "Nlsv";
      NewWindowTarget = "Documents";
      QuitMenuItem = false;
      ShowPathbar = true;
      ShowStatusBar = true;
      # Show the full path in the window title
      _FXShowPosixPathInTitle = true;
    };

    loginwindow = {
      GuestEnabled = false;
      LoginwindowText = "Hello, me.";
    };

    menuExtraClock = {
      Show24Hour = true;
      ShowAMPM = false;
      ShowDate = 0; # When space allows
    };
  };

  # Use touchId to authenticate sudo
  security.pam.services.sudo_local.touchIdAuth = true;
}
