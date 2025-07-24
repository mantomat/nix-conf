{ pkgs, ... } :
let
  ohMyZshPath = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
  zshAutoSuggestPath = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
  zshSyntaxHighlightPath = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting";

  zshPathsFile = pkgs.writeTextFile {
    name = "nix-zsh-paths";
    text = ''
      export ZSH="${ohMyZshPath}"
      export ZSH_SYNTAX_HIGHLIGHTING="${zshSyntaxHighlightPath}"
    '';
  };
in {
  environment.etc."zsh/nix-zsh-paths".source = zshPathsFile;
}
