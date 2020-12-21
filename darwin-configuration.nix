{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  imports = [ <home-manager/nix-darwin> ];
  users.users.xanderle.name = "xanderle";
  users.users.xanderle.home = "/Users/xanderle";
  home-manager.users.xanderle = (import /Users/xanderle/.nixpkgs/xanderle.nix);
  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = "0.0";
      orientation = "left";
    };

    NSGlobalDomain = {
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      _HIHideMenuBar = true;
    };

  };
  fonts = {
    enableFontDir = true;
  fonts = with pkgs; [ nerdfonts ]; 
};
    services.skhd.enable = true;
  services.skhd.skhdConfig = builtins.readFile ./applications/skhd/skhd.conf;

  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    #enableScriptingAddition = true;
    config = {
#      window_border              = "on";
#      window_border_width        = 5;
      #active_window_border_color = "0xff81a1c1";
      #normal_window_border_color = "0xff3b4252";
      #focus_follows_mouse        = "autoraise";
      mouse_follows_focus        = "off";
      window_placement           = "second_child";
      window_opacity             = "off";
      window_topmost             = "on";
      window_shadow              = "float";
      active_window_opacity      = "1.0";
      normal_window_opacity      = "1.0";
      split_ratio                = "0.50";
      auto_balance               = "on";
      mouse_modifier             = "fn";
      mouse_action1              = "move";
      mouse_action2              = "resize";
      layout                     = "bsp";
      top_padding                = 10;
      bottom_padding             = 10;
      left_padding               = 10;
      right_padding              = 10;
      window_gap                 = 10;
      external_bar               = "all:26:0";
    };

    extraConfig = ''
      # rules
      yabai -m rule --add app='System Preferences' manage=off
      yabai -m rule --add app='Live' manage=off
    '';
  };

  services.spacebar.enable = true;
  services.spacebar.package = pkgs.spacebar;
  services.spacebar.config = {
    debug_output       = "on";
    position           = "top";
    clock_format       = "%R";
    space_icon_strip   = "   ";
    text_font          = ''"Hack Nerd Font Mono:Regular:12.0"'';
    icon_font          = ''"Hack Nerd Font Mono:Regular:12.0"'';
    background_color   = "0xff2e3440";
    foreground_color   = "0xffd8dee9";
    space_icon_color   = "0xff81a1c1";
    dnd_icon_color     = "0xff81a1c1";
    clock_icon_color   = "0xff81a1c1";
    power_icon_color   = "0xff81a1c1";
    battery_icon_color = "0xff81a1c1";
    power_icon_strip   = " ";
    space_icon         = "";
    clock_icon         = "";
    dnd_icon           = "";
  };


#  environment.systemPackages = with pkgs;
#    [ 
#      "./overlays/default.nix"
#    ];
#
  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nixpkgs.overlays = [
  
  ];
  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
