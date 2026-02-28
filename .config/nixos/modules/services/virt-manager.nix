{ pkgs, mainUser, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = [ pkgs.virtiofsd ];
  };

  programs.virt-manager.enable = true;

  users.users.${mainUser}.extraGroups = [ "libvirtd" ];
}
