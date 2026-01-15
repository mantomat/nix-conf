{ pkgs, ... }: {
    fonts.packages = with pkgs; [
        atkinson-hyperlegible
        atkinson-hyperlegible-next
        atkinson-hyperlegible-mono
        font-awesome
        nerd-fonts.jetbrains-mono
        nerd-fonts.noto
        roboto
        source-sans-pro
    ];
}
