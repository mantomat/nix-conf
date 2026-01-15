{ ... }: {
  system.primaryUser = "mantomat";

  # Don't produce that horror-like sound when turning on, please
  system.startup.chime = false;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Use trackpad silent clicking
  system.defaults.trackpad.ActuationStrength = 0;

  # Use a separate space for each display
  system.defaults.spaces.spans-displays = false;

  system.defaults.screensaver.askForPassword = true;
  system.defaults.screensaver.askForPasswordDelay = 0;

  # Activity monitor shows the CPU usage in the dock while running
  system.defaults.ActivityMonitor.IconType = 5;
  # Show all processes hierarchically
  system.defaults.ActivityMonitor.ShowCategory = 101;

  # Set system dark mode
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";

  # Disable press&hold
  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;

  # Show all extensions in the finder
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  # Show hidden files in the finder
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true;

  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;

  system.defaults.NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;

  system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
  system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;
  system.defaults.NSGlobalDomain.PMPrintingExpandedStateForPrint = true;
  system.defaults.NSGlobalDomain.PMPrintingExpandedStateForPrint2 = true;

  # Show medium finder/settings sidebar icons (1 small, 3 large)
  system.defaults.NSGlobalDomain.NSTableViewDefaultSizeMode = 2;

  # Don't emit sounds when setting the volume
  system.defaults.NSGlobalDomain."com.apple.sound.beep.feedback" = 0;

  # Group windows in the mission control exposé (requested by Aerospace)
  system.defaults.dock.expose-group-apps = true;

  system.defaults.WindowManager.EnableStandardClickToShowDesktop = false;

  # No margins when tiling windows
  system.defaults.WindowManager.EnableTiledWindowMargins = false;

  # TODO control center setup

  # Dock
  system.defaults.dock.autohide = true;
  system.defaults.dock.autohide-delay = 0.0;
  system.defaults.dock.minimize-to-application = true;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.tilesize = 48;
  system.defaults.dock.persistent-apps = [ ];

  # Finder
  # Search in current folder by default
  system.defaults.finder.FXDefaultSearchScope = "SCcf";
  # Default to list view
  system.defaults.finder.FXPreferredViewStyle = "Nlsv";
  system.defaults.finder.NewWindowTarget = "Documents";
  system.defaults.finder.QuitMenuItem = false;
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder.ShowStatusBar = true;
  # Show the full path in the window title
  system.defaults.finder._FXShowPosixPathInTitle = true;

  system.defaults.loginwindow.GuestEnabled = false;
  system.defaults.loginwindow.LoginwindowText = "Hello, me.";

  system.defaults.menuExtraClock.Show24Hour = true;
  system.defaults.menuExtraClock.ShowAMPM = false;
  system.defaults.menuExtraClock.ShowDate = 0; # When space allows

  # Use touchId to authenticate sudo
  security.pam.services.sudo_local.touchIdAuth = true;
}
