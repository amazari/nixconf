{ config, pkgs, ... }:
{
   boot.kernelParams = [ "intel_iommu=on iommu=pt"]; 
}
