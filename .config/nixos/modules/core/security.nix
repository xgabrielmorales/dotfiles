{ ... }:

{
  security.polkit.enable = true;
  programs.ssh.startAgent = true;
  services = {
    gnome.gnome-keyring.enable = true;
    gnome.gcr-ssh-agent.enable = false;
  };
}
