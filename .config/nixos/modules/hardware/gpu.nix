{ ... }:

{
  hardware.graphics.enable = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
  boot.kernelParams = [ "amdgpu.gpu_recovery=1" ];
}
