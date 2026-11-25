{ pkgs, ... }:

{
  security.polkit.enable = true;
  security.pam.services.waylock = { };
  environment.systemPackages = [ pkgs.bitwarden-desktop ];
  environment.sessionVariables.SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
  services = {
    gnome.gnome-keyring.enable = true;
    gnome.gcr-ssh-agent.enable = false;
  };
}
