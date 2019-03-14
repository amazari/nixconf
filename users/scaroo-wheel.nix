{ config, pkgd, ... }:
{
  users.users.scaroo = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCgZMbregaBT4T4c4IiLG7+rEE/Mc4utyKNCKuWMCKI/ZKjjx2skniLth4rUxmBTX+nl8U2fEqXGDjHOQ4rtKrKVxx+LOXgR2qIFcyPUxoRrB20liuS2hZsjYVFyzzUwvTpusG1oQoaZdrqQ7m/bS8MZ+g87HXyxyyF/DYpIADmf1y59WPtzODVxAhpg/7o44fXMN4Qzb3wAdVgCUKgHevk8Sust/n1EhgsJE5RYlaeVVyaLFEZKcctOnwOJ//HjmEVaDgAfhsB1l1TU5mgUu6rHqH2ySf9tPfMkd6+41Lu+cd3REoUk8k7lnkHnjcLIX+UE5PahXQlSPG9FpSp38SWF/lc/dW5EN4dznflbeuRBAPVzrJV2g2yvEJINP0c5wlo/Den9bpaE88kiFLxxYdOXOoHUNJb/MIAFYB4xfKBt0GncEBllgCOhx12uJ9LGF1r+4KfoPzKBj9VVlgwfRBKVsoRcztCQNxkV8N1wcBoSG635gt30KH4jJFLcTLRHnznalNzuPCpSe5XXv2dW0PFrKqyOx0/s063sGbvfEbUG014/OzKzaQPlm643T6ZYPTO+v+0Zj7aHK+atBRc7SDM6yU8Xgl8AWB6OaqGnXPLFoHgm1NQPgl9eAAupljzfenpWn59NMie+giUSZaHYDh1wY6/0jla84UO2qVlYqVhyw== scaroo@gmail.com"
    ];
  };
}
