{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      bars = [
        ({
          command = "waybar";
        })
      ];
      input."*" = {
        xkb_layout = "ie";
        xkb_options = "caps:backspace";
        dwt = "enabled";
	tap = "enabled";
	natural_scroll = "enabled";
	middle_emulation = "enabled";
      };
      menu = "${pkgs.dmenu}/bin/dmenu_path | ${pkgs.rofi-wayland}/bin/rofi -show drun -show-icons | ${pkgs.findutils}/bin/xargs swaymsg exec --";
#     startup = [];
      workspaceAutoBackAndForth = true;
    };
    extraConfig = ''
      bindsym Mod4+Escape exec swaylock
      bindsym Mod4+c exec grim "$(slurp) /tmp/$(date + '%H:%M:%S.png')

      exec dbus-sway-environment
      exec configure-gtk

      output * bg ~/.config/wallpaper/wallpaper.png fill
      default_border none

      bindsym XF86MonBrightnessDown exec light -U 10
      bindsym XF86MonBrightnessUp exec light -A 10

      bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'
      bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'
      bindsym XF86AudioMute exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'

      assign [app_id="kitty"] workspace 1
      assign [app_id="firefox"] workspace 2

      exec swaymsg 'workspace 1; exec kitty';
    '';
  };
}
