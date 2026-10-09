{ config, ... }:

let
  secret = name: config.sops.placeholder."wireguard/homelab/${name}";
in
{
  sops = {
    secrets = {
      "wireguard/homelab/endpoint" = { };
      "wireguard/homelab/presharedKey" = { };
      "wireguard/homelab/privateKey" = { };
      "wireguard/homelab/publicKey" = { };
    };
    templates."wg-homelab.conf".content = ''
      [Interface]
      PrivateKey = ${secret "privateKey"}
      Address = 10.8.0.3/32, fdcc:ad94:bacf:61a4::cafe:3/128
      MTU = 1420
      DNS = 10.10.10.3

      [Peer]
      PublicKey = ${secret "publicKey"}
      PresharedKey = ${secret "presharedKey"}
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
