{ mainUser, ... }:

{
  # Servicios
  services.syncthing = {
    enable = true;
    user = mainUser;
    dataDir = "/home/${mainUser}";
  };
}
