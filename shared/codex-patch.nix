{ ... }: {
  # Codex loads these defaults before the per-user configuration.
  environment.etc."codex/config.toml".source = ../stow/.config/codex/config.toml;
}
