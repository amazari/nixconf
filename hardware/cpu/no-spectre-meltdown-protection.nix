{ config, lib, pkgs, ... }:
{
 boot.kernelParams = [ "i915.fastboot=1" "quiet" "pti=off" "l1tf=off"
 "nospec_store_bypass_disable" "nospectre_v1" "nospectre_v2" "spec_store_bypass_disable"]; 
}
