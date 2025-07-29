{ config, lib, pkgs, flake-inputs, ... }:    

{
    programs.firefox = {
      enable = true;
      package = pkgs.firefox.override {cfg.enableTridactylNative = true;};
      profiles."default" = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          onepassword-password--manager
          ublock-origin
          unpaywall
          video-downloadhelper
          vimium
          privacy-badger
          no-pdf-download
          gruvbox-dark-theme
          darkreader
          #istilldontcareaboutcookies
          decentraleyes
          no-pdf-download
          translate-web-pages
          #pywalfox

          #hackontext
          #hacktools
          #penetration-testing-kit

#          keepassxc-browser
#          libredirect
#          react-devtools
#          reduxdevtools
#          aria2-integration
#          buster-captcha-solver
#          clearurls
#          tridactyl

          # # Missing:
          # cloudhole
          # devtools-adb-extension
          # firefox-sticky-window-containers
        ];

#        userChrome =
#          builtins.readFile "${firefox-ui-fix}/css/leptonChrome.css";
#        userContent =
#          builtins.readFile "${firefox-ui-fix}/css/leptonContent.css";
        settings = {
          # Performance settings
          "gfx.webrender.all" = true; # Force enable GPU acceleration
          "media.ffmpeg.vaapi.enabled" = true;
          "widget.dmabuf.force-enabled" = true; # Required in recent Firefoxes

          # Re-bind ctrl to super (would interfere with tridactyl otherwise)
          "ui.key.accelKey" = 91;

          # Keep the reader button enabled at all times; really don't
          # care if it doesn't work 20% of the time, most websites are
          # crap and unreadable without this
          "reader.parse-on-load.force-enabled" = true;

          # Hide the "sharing indicator", it's especially annoying
          # with tiling WMs on wayland
          "privacy.webrtc.legacyGlobalIndicator" = false;

          # Actual settings
          "app.shield.optoutstudies.enabled" = false;
          "app.update.auto" = false;
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.contentblocking.category" = "strict";
          "browser.ctrlTab.recentlyUsedOrder" = false;
          "browser.discovery.enabled" = false;
          "browser.laterrun.enabled" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" =
            false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" =
            false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
          "browser.newtabpage.activity-stream.section.highlights.includePocket" =
            false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.pinned" = false;
          "browser.protections_panel.infoMessage.seen" = true;
          "browser.quitShortcut.disabled" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.ssb.enabled" = true;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          "browser.urlbar.suggest.openpage" = false;
          "datareporting.policy.dataSubmissionEnable" = false;
          "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "extensions.pocket.enabled" = false;
          "identity.fxaccounts.enabled" = false;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
        };
      };
#    };

#    home.file.".mozilla/firefox/${config.programs.firefox.profiles.tlater.path}/user.js" = {
#      source = settings-file;
#    };
  };
}
