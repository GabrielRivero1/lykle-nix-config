{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lykle";
  home.homeDirectory = "/home/lykle";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
 
  # Install GNOME extensions.
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    ];

  imports = 
  [
    ./browser.nix
  ];


  # GNOME Dark Mode, Default Apps, and Tray Icons Enable.
  dconf = {
    enable = true;
    settings = {
      # GNOME Extensions
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
            "appindicatorsupport@rgcjonas.gmail.com" # Tray Icons Extension.
          ];
        };
      # GNOME Theming
      "org/gnome/desktop/interface" = { # Dark Mode
      color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/background" = { # Wallpapers
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-l.png";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.png";
      };
      "org/gnome/desktop/screensaver" = { # Screensavers
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.png";
      primary-color = "#3465a4";
      secondary-color = "#000000";
      };
      # GNOME Default Dash Config
      "org/gnome/shell" = {
        favorite-apps = [
	"librewolf.desktop"
	"vesktop.desktop"
	"bitwarden.desktop"
	"steam.desktop"
	"net.lutris.Lutris.desktop" 
	"org.prismlauncher.PrismLauncher.desktop" 
	"com.obsproject.Studio.desktop" 
	"audacity.desktop"
	"org.kde.kdenlive.desktop"
	"org.gnome.Nautilus.desktop"
	"org.gnome.Console.desktop"
	];
      };
    };
  };

  # Global Cursor
  home = {
    pointerCursor = {
      package = pkgs.adwaita-icon-theme;
      gtk.enable = true;
      name = "Adwaita";
      size = 32;
     };
  };
}

