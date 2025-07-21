{ pkgs, ... }: {
    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        atkinson-hyperlegible
        atkinson-hyperlegible-next
        atkinson-hyperlegible-mono
    ];
}
