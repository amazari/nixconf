{ config, lib, pkgs, ... }:
{
  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
      options = [ "data=writeback" "noatime" ];
  };

  swapDevices = [ { device = "/dev/disk/by-label/swap"; }];
}
