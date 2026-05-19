{ ... }:

{
  sops = {
    defaultSopsFile = ../../secrets.yml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/keys.txt";
  };
}
