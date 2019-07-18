# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/hardware/network/broadcom-43xx.nix>
      <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
      <nixos-hardware/common/cpu/intel/kaby-lake>
      <nixos-hardware/common/pc/laptop>
      <nixos-hardware/common/pc/laptop/acpi_call.nix>

      ../cpu/no-spectre-meltdown-protection.nix
      ../gpu/bumblebee.nix
      ../storage/partitionning/boot-root-swap-labeled.nix
      ../misc/bluetooth.nix
    ];

 boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" 
"sd_mod" "rtsx_pci_sdmmc" ];

  nix.maxJobs = lib.mkDefault 8;

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
#  powerManagement.powertop.enable = true;
  services.undervolt = {
    enable = true;
    coreOffset = "-150";
    uncoreOffset = "-150";
    analogioOffset = "-150";
    temp = "97";
  };

  # touchpad goes over i2c
  boot.blacklistedKernelModules = [ "psmouse" ];
}
