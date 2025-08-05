# Tools for working with Android/iOS devices

{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.mobile;

in {
    options.modules.mobile = { enable = mkEnableOption "mobile"; };
    config = mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        abootimg
        androguard
        apkeep
        # apkleaks
        apktool
        dex2jar
        genymotion
        ghost
        morf
        payload-dumper-go
        scrcpy
        simg2img
        trueseeing
      ];
    };
}
