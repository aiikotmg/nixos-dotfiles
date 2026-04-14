{ pkgs, config, lib, ... }:


with lib;
let cfg = config.modules.git;

in {
    options.modules.git = { enable = mkEnableOption "git"; };
    config = mkIf cfg.enable {
      programs.git = {
        enable = true;
#        package = pkgs.gitAndTools.gitFull;
        package = pkgs.gitFull;
        userName = "aiikotmg";
        userEmail = "sslerror@protonmail.com";
#        signing.format = "opengpg";
        settings = {
          init.defaultBranch = "main";
         color = { ui = "auto";};
          pull.rebase = "false";
          core.editor = "nvim";
        };
    };
    programs.gitui.enable = true;
   };

}
