export EDITOR=nvim

# nix-darwin
function drs {
  local zshrc="${ZDOTDIR:-$HOME}/.zshrc"
  local repo_dir="${zshrc:A:h:h}"

  sudo darwin-rebuild switch --flake "$repo_dir" &&
    stow --dir="$repo_dir/stow" --target="$HOME" --restow .
}

alias ncg="nix-collect-garbage -d && sudo nix-collect-garbage -d"

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--tmux --preview '~/.config/fzf/preview.sh {}'"

################## oh-my-zsh ##################

# Since we need to get the nix-store paths from nix-eval but it's definitely too slow to put it here,
# we dump a file that exports variables with those paths when we do darwin-rebuild switch.
source /etc/zsh/nix-zsh-paths

# Theme
ZSH_THEME="robbyrussell"

# Dynamically resolve and load oh-my-zsh path from nix store
source $ZSH/oh-my-zsh.sh

# Plugins
source "$ZSH_SYNTAX_HIGHLIGHTING/zsh-syntax-highlighting.zsh"

################ end oh-my-zsh ################

eval "$(direnv hook zsh)"
