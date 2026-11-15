_:

{
  boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ];

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchExternalPower = "suspend-then-hibernate";
  };

  services = {
    upower.enable = true;
    tlp = {
      enable = true;
      settings = {
        # CPU governor: powersave uses lower frequencies unless needed
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        # Energy/performance preference via EPP (Intel HWP / AMD CPPC)
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        # Turbo boost on AC only
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        # ACPI platform profile (handled by amd-pmf): caps the SoC sustained/
        # boost power limits (SPL/sPPT/fPPT) and thermal targets.
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        # WiFi power saving
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";

        # Runtime power management for PCI(e) devices
        RUNTIME_PM_ON_AC = "on";
        RUNTIME_PM_ON_BAT = "auto";
      };
    };
  };
}
