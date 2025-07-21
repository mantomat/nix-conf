{ ... }: {
  networking.computerName = "mantomat";
  networking.hostName = "mantomat";
  networking.knownNetworkServices = [ "AX88179A" "Thunderbolt Bridge" "Wi-Fi" ];
  networking.dns = [ "8.8.8.8" "8.8.4.4" ];
}
