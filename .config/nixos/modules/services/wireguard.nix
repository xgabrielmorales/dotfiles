{ config, ... }:

let
  host = config.networking.hostName;
  addresses = {
    xgm = "10.8.0.3/32, fdcc:ad94:bacf:61a4::cafe:3/128";
    xgm-work = "10.8.0.4/32, fdcc:ad94:bacf:61a4::cafe:4/128";
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

      [Peer]
      PublicKey = ${secret "publicKey"}
      PresharedKey = ${secret "${host}/presharedKey"}
      AllowedIPs = 0.0.0.0/0, ::/0
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
