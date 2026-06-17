{ ... }:

{
  security.polkit.enable = true;
  security.pam.services.waylock = { };
  programs.ssh.startAgent = true;
  services = {
    gnome.gnome-keyring.enable = true;
    gnome.gcr-ssh-agent.enable = false;
  };
}
