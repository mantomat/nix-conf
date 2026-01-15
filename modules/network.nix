{ ... }: {
  networking.computerName = "mantomat-mba";
  networking.hostName = "mantomat-mba";
  networking.knownNetworkServices = [ "AX88179A" "Thunderbolt Bridge" "Wi-Fi" ];
  networking.dns = [ "8.8.8.8" "8.8.4.4" ];
}
