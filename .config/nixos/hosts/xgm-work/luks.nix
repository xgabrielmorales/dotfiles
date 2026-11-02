_:

{
  boot.initrd.luks.devices."luks-7e1a85c0-58fe-4921-90c6-fdc431754c89" = {
    allowDiscards = true;
    crypttabExtraOpts = [ "fido2-device=auto" ];
  };
}
