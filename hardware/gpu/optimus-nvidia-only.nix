{config, lib, pkgs, ...}:
{
  imports = [ ./nvidia-common.nix ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.optimus_prime.enable = true;
  # Bus ID of the NVIDIA GPU. You can find it using lspci
  hardware.nvidia.optimus_prime.nvidiaBusId = "PCI:1:0:0";
  # Bus ID of the Intel GPU. You can find it using lspci
  hardware.nvidia.optimus_prime.intelBusId = "PCI:0:2:0";
  hardware.nvidia.modesetting.enable = true;
}
