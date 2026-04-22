{ ... }:

{
  security.polkit.enable = true;
  security.pam.services.swaylock = { };
  security.pam.services.greetd.enableGnomeKeyring = true;
  programs.ssh.startAgent = true;
  services = {
    gnome.gnome-keyring.enable = true;
    gnome.gcr-ssh-agent.enable = false;
  };
}
