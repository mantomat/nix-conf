# nix-conf MacOs Config

## Home, configuration and dotfiles
1. Install the dependencies (git, etc.):
	```bash
	$ xcode-select --install
	```

2. Install Homebrew:
	```bash
	$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	```

3. Install Nix:
	```bash
	$ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
	  sh -s -- install
	```

4. Load the ssh key or create one, then login to GitHub.

5. Clone the nix-conf repo:
	```bash
	$ git clone git@github.com:mantomat/nix-conf.git
	```

6. Install `nix-darwin` and apply the configuration:
	```bash
	$ nix run nix-darwin/master#darwin-rebuild -- build --flake .#mantomat
	$ sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#mantomat
	```

7. Deploy the dotfiles using stow and the script provided:
	```bash
	$ ./scripts/dotfiles.sh
	```

## Restore data
Two options:
1. Copy the documents folder in an ssd and paste it in the file system (recommended).
2. Setup the backup system and restore files from there

## Restore backup system
1. Ensure kopia and rsync are installed
2. Copy rsync config-file in the `.config/rsync` folder (it's secret, so ensure to backup it manually on ssd)
3. Copy kopia config files somewhere and modify the fields written in `{{ ... }}` according to the current setup.
4. Load the repositories.
	- For the SSD, just open the `kopia` folder and it will automatically recognize the repository.
	- To initialize KopiaUI from a config-file (for drive):
	```bash
	$ export KOPIA_PASSWORD='your-password'
	
	$ /Applications/KopiaUI.app/Contents/Resources/server/kopia \
	  --log-level=debug \
	  repository connect from-config \
	  --file="/Users/mantomat/kopia/config/kopia-googledrive.config.json" \
	  --use-keychain \
	  --persist-credentials
	```

Note: You can use `read -s -p "Kopia password: " KOPIA_PASSWORD; echo` to avoid storing the password in your shell history.

## Other
- Remove cmd+space for spotlight and import raycast config
