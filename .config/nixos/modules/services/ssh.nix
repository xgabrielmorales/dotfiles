_:

{
  services.openssh = {
    enable = true;
    openFirewall = false;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # ssh only reachable through my homelab wireguard tunnel
  networking.firewall.interfaces.homelab.allowedTCPPorts = [ 22 ];
}
