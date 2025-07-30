
#modules from https://github.com/fabaff/nix-security-box

{ pkgs, config, ... }:

{

  imports = [
#    ./pentest/wireless.nix
#    ./pentest/traffic.nix
#    ./pentest/packet-generators.nix
   
  ];


  
  environment.systemPackages = with pkgs; [

    iproute
    iproute2
    macchanger
    iftop
    btop
    iotop
    ipscan
    nmap
    zmap

  ];

}
