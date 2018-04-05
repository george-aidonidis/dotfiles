# i3 (i3-gaps)

<!-- TOC depthFrom:2 -->

- [Basic goals:](#basic-goals)
- [Key Bindings](#key-bindings)
  - [Window basics](#window-basics)
  - [Basic Programs](#basic-programs)
  - [Modes](#modes)
  - [Workspaces](#workspaces)
  - [Recording](#recording)
  - [Other buttons](#other-buttons)
- [Appearance](#appearance)
- [Packages](#packages)

<!-- /TOC -->

## Basic goals:
* Borderless: Programs should be simple, I found borders to be too distracting (you can always enable them by pressing `Mod+B`)
* Keyboard/vim-alike: The approach is to use vim key bindings
* General keyboard changes: Esc is mapped to caps-lock and Esc to caps-lock. The Ctrl key is also mapped to Alt (as I find that more easier to press).

## Key Bindings
All of the bindings below are in ~/.config/i3/config can all be easily changed. Please note that because of the two layouts that I am using I have defined all keyboard codes to their own variables and use `bindcode` instad of `bindsym`.

### Window basics
:rotating_light: Notice the case sensitivity of the shortcuts.

* `Mod+Enter`: Spawn terminal
* `Mod+q` or `Q`: Close window
* `Mod+d`: rofi (For running commands or programs without shortcuts)
* `Mod+t`: Toggle between spawning vertically and horizontally
* `Mod+f`: Fullscreen
* `Mod+h/j/k/l`: Move to different windows
* `Mod+H/J/K/L`: Move a window around
* `Mod+Space`: Change keyboard layout (en/gr)

### Basic Programs

* `Mod+a`: ranger (file browser/manager)
* `Mod+i`: htop (system info)
* `mod+w`: wifi-menu (accessing wifi networks)

### Modes

Modes are triggered with the following combinations. Then you can press the indicated key to execute the operation.

* `Mod+Shift+F10`: Bluetooth headset -> Press `0` to Disconnect or 1 to Connect

* `Mod+Shift+F7`: Display chooser -> Press `0` to activate Laptop Screen or `1` for the Main or `2` for all screens

* `Mod+Shift+F4`: Session manager -> (E)xit (L)ock (P)oweroff (R)eboot

* `Mod+Insert`: Screencast mode -> (0)Laptop - (1)Main

* `Mod+R`: Resize mode -> Press `h/j/k/l` to resize the windows accordingily


### Workspaces

There are ten workspaces. They work just like those in vanilla i3 with some additions.

* `Mod+(Number)`: Go to that number workspace
* `Mod+Shift+(Number)`: Send window to that workspace
* `Alt+Mod+l`: Send workspace to screen on the right
* `Alt+Mod+h`: Send workspace to screen on the left
* `Ctrl+Tab`: Go to next workspace
* `Ctrl+Shift+Tab`: Go to previous workspace
* `Mod+Ctrl+h`: Go to left workspaceright
* `Mod+Ctrl+l`: Go to right workspace

### Recording

* Print Screen: Take a screenshot of the active screen and save it under `Pictures/screenshots/`
* Ctrl+Shift+F1: Capture a region and upload it to imgur
* Ctrl+Shift+F4: Capture a region and pass it to system's clipboard
* Mod+Insert -- Screencast mode
* Mod+Delete -- kills ffmpeg, thus ending recordings

### Other buttons

...

## Appearance

You can use `lxappearance` and configure some basic settings regarding windows title colors etc...

Here is what lxappearance looks like:

![lxappearance](https://i.imgur.com/jrPrlNf.png)

You should also apply the settings inside the `~/.config/.gtk3.0/settings.ini` file since some apps are using that to configure their styling.
Please note that I have included the `breeze` theme inside the [.Xresources](../../../homeconfig/.Xresources) file (`breeze` is also included inside the [install](../../../install.sh) script).

## Packages

Here are important packages that current i3 configuration uses:

* [light-git](https://aur.archlinux.org/packages/light-git): Used for controlling screen brightness
* [playerctl](https://www.archlinux.org/packages/community/x86_64/playerctl/): Used for controlling play/pause/next/forward/stop etc... media keys.
* [betterlockscreen](https://aur.archlinux.org/packages/betterlockscreen-git/): A nice lock screen (will pick one random picture from `~/Pictures/Wallpapers folder, so make sure to have one there or change the path to your likings)
