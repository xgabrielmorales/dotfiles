{ lib, ... }:

let
  audioNodeNames = {
    "alsa_input.pci-0000_06_00.6.HiFi__Mic1__source" = "Integrated Microphone";
    "alsa_input.usb-Apple__Inc._EarPods_D4W9Y390VC-00.mono-fallback" = "EarPods";
    "alsa_input.usb-DCMT_Technology_USB_Condenser_Microphone_214b206000000178-00.mono-fallback" =
      "Maono Condenser";
    "alsa_input.usb-DCMT_Technology_USB_Lavalier_Microphone_214b206000000178-00.mono-fallback" =
      "Maono Lavalier";
    "alsa_output.pci-0000_06_00.6.HiFi__Speaker__sink" = "Integrated Speakers";
    "alsa_output.pci-0000_0a_00.6.analog-stereo" = "Speakers";
    "alsa_output.usb-Apple__Inc._EarPods_D4W9Y390VC-00.analog-stereo" = "EarPods";
  };
in
{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.extraConfig."51-bluez-dummy-avrcp" = {
      "monitor.bluez.properties" = {
        "bluez5.dummy-avrcp-player" = true;
      };
    };
    wireplumber.extraConfig."52-rename-audio-nodes" = {
      "monitor.alsa.rules" = lib.mapAttrsToList (nodeName: description: {
        matches = [ { "node.name" = nodeName; } ];
        actions.update-props = {
          "node.description" = description;
          "node.nick" = description;
        };
      }) audioNodeNames;
    };
  };
}
