{ config, pkgs, ... }:
{

# containers.zoneminder =
 # { config =
 #     { config, pkgs, ... }:
 #     {
 #       services.zoneminder.enable = true;
 #       services.zoneminder.database.createLocally = true;
 #     };
 # };

 services.mysql = {
 		 enable = true;
		 package = pkgs.mariadb;
    };

  services.zoneminder.enable = true;
  services.zoneminder.database.createLocally = true;

}
