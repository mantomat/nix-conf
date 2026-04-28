export EDITOR=nvim

# nix-darwin
alias drs="nix flake update --flake /Users/mantomat/nix-conf && sudo darwin-rebuild switch --flake /Users/mantomat/nix-conf#system"
alias ncg="sudo nix-collect-garbage"

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
