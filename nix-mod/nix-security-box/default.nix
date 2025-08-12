{ pkgs, lib, config, inputs, ... }:


# credit to https://github.com/fabaff/nix-security-box/
# i just modified the structure to fit my config
# havent tried all modules, afaik there are no errors here


{

  imports = [
    ./docs/nix-security-tool-box.nix
    ./bluetooth
    ./cloud
    ./code
    ./common
    ./container
    ./dns
    ./exploits
    ./forensics
    ./fuzzers
    ./generic
    ./hardware
    ./host
    ./infogather
    ./kube
    ./ldap
    ./load-testing
    ./malware
    ./misc
    ./mobile
    ./network
    ./packet-gen
    ./pswd
    ./port-scan
    ./proxies
    ./reveng
    ./services
    ./smartcards
    ./terminals
    ./tls
    ./traffic
    ./tunneling
    ./voip
    ./web
    ./windows
    ./wireless
  ];

#    environment.systemPackages = with pkgs; [
#
#    ];
}
