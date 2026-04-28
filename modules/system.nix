{ ... }:
{
  system.primaryUser = "mantomat";

  # Don't produce that horror-like sound when turning on, please
  system.startup.chime = false;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  system.defaults = {
    # Use trackpad silent clicking
    trackpad.ActuationStrength = 0;

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
      # No margins when tiling windows
      EnableTiledWindowMargins = false;
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
