{ mainUser, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "labwc";
        user = mainUser;
      };
    };
  };
}
