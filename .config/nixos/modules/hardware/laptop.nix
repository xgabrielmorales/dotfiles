{ ... }:

{
  services = {
    upower.enable = true;
    tlp = {
      enable = true;
      settings = {
        # CPU governor: powersave uses lower frequencies unless needed
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        # Energy/performance preference via EPP (Intel HWP / AMD CPPC)
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        # Disable CPU turbo boost on AC to reduce heat
        # Set to 1 to re-enable if you need full performance
        CPU_BOOST_ON_AC = 0;
        CPU_BOOST_ON_BAT = 0;

        # PCIe Active State Power Management
        PCIE_ASPM_ON_AC = "powersupersave";
        PCIE_ASPM_ON_BAT = "powersupersave";

        # Runtime power management for PCI(e) devices
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";
      };
    };
  };

  # Disable runtime power management for the I2C controller that drives the
  # ELAN touchpad to prevent input lag caused by controller suspend/resume
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="platform", KERNEL=="AMDI0010:03", DRIVER=="i2c_designware", ATTR{power/control}="on"
  '';

  # WiFi
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    General.EnableNetworkConfiguration = true;
    Network.NameResolvingService = "systemd";
  };
}
