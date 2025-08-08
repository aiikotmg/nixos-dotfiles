# Tools for working with web servers, web applications, APIs, etc.

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.web;

in {
    options.modules.web = { enable = mkEnableOption "web"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        # apachetomcatscanner
        albedo
        arjun
        brakeman
        # cameradar
        cansina
        cariddi
        chopchop
        clairvoyance
        commix
        crackql
        crlfsuite
        dalfox
        dismap
        dirstalk
        dontgo403
        forbidden
        galer
        gau
        genzai
        gospider
        gotestwaf
        gowitness
        graphpython
        graphqlmaker
        graphqlmap
        graphw00f
        hakrawler
#        python3Packages.hakuin
        hey
        http-server
        httpx
        nodePackages.hyperpotamus
        jaeles
        jsubfinder
        jwt-hack
        katana
        kiterunner
        mantra
        mitmproxy2swagger
        monsoon
        nikto
        nomore403
        ntlmrecon
        offat
        photon
        plecost
        scraper
        slowlorust
        snallygaster
        subjs
        swaggerhole
        uddup
        urlfinder
        wad
        webanalyze
        websecprobe
        whatweb
        wprecon
        wpscan
        wsrepl
        wuzz
        xcrawl3r
        xnlinkfinder
        xsubfind3r
      ];
    };
}
