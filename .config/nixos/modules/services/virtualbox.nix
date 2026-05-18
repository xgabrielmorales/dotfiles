{ mainUser, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.users.${mainUser}.extraGroups = [ "vboxusers" ];
}
