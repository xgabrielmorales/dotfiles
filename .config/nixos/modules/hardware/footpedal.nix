{ mainUser, ... }:

{
  hardware.uinput.enable = true;
  users.users.${mainUser}.extraGroups = [
    "input"
    "uinput"
  ];
}
