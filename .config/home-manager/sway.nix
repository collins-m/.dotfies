{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      bars = [
        ({
          position = "top";
	  statusCommand = "while date +'%y-%m-%d %H:%M:%S %p'; do sleep 1; done";
          colors = {
            statusline = "#ffffff";
	    background = "#282828";
	    focusedWorkspace = {
	      background = "#928374";
	      border = "#928374";
	      text = "#ebdbb2";
	    };
	    inactiveWorkspace = {
	      background = "#1d2021";
	      border = "#1d2021";
	      text = "#665c54";
	    };
	  };
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
    };
    extraConfig = ''
      exec swaymsg "workspace 1"; exec $term"
      exec swaymsg "workspace 2"; exec $browser"
      exec swaymsg "workspace 1"

      bindsym Mod4+Escape exec swaylock
      output * bg ~/.config/wallpaper/wallpaper.png fill
      default_border none

      bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'
      bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'
      bindsym XF86AudioMute exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'
    '';
  };
}
