{ config, ... }:

let
  host = config.networking.hostName;
  addresses = {
    xgm = "10.10.11.3/32, fdcc:ad94:bacf:61a4::cafe:3/128";
    xgm-work = "10.10.11.2/32, fdcc:ad94:bacf:61a4::cafe:2/128";
  };
  secret = name: config.sops.placeholder."wireguard/${name}";
in
{
  sops = {
    secrets = {
      "wireguard/endpoint" = { };
      "wireguard/publicKey" = { };
      "wireguard/${host}/presharedKey" = { };
      "wireguard/${host}/privateKey" = { };
    };
    templates."wg-homelab.conf".content = ''
      [Interface]
      PrivateKey = ${secret "${host}/privateKey"}
      Address = ${addresses.${host}}
      MTU = 1420
      DNS = 10.10.10.3

      [Peer]
      PublicKey = ${secret "publicKey"}
      PresharedKey = ${secret "${host}/presharedKey"}
      AllowedIPs = 10.10.10.0/23
      PersistentKeepalive = 25
      Endpoint = ${secret "endpoint"}
    '';
  };
  networking = {
    wg-quick.interfaces.homelab = {
      configFile = config.sops.templates."wg-homelab.conf".path;
      autostart = false;
    };
  };
}
