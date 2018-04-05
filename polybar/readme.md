<!-- TOC -->

- [What's polybar](#whats-polybar)
- [How it's configured in this repo](#how-its-configured-in-this-repo)
  - [Workspaces](#workspaces)
  - [Spotify (custom)](#spotify-custom)
  - [Weather (custom)](#weather-custom)
  - [Filesystem](#filesystem)
  - [Backlight](#backlight)
  - [Volume](#volume)
  - [Cpu](#cpu)
  - [Cpu temperature](#cpu-temperature)
  - [Ram](#ram)
  - [Network traffic](#network-traffic)
  - [Arch packages to update (custom)](#arch-packages-to-update-custom)
  - [Battery](#battery)
  - [Date and time](#date-and-time)
  - [Keyboard layout](#keyboard-layout)
  - [Power module (custom)](#power-module-custom)
  - [Tray icons](#tray-icons)

<!-- /TOC -->

![image](https://i.imgur.com/oTQc6FT.png)

## What's polybar

Polybar is a customizable status bar that suits my needs and likings. You can read more about it [here](https://github.com/jaagr/polybar).

## How it's configured in this repo

At the moment polybar is configured in a combination of default modules and some custom ones. Check how to add your custom script [here](https://github.com/jaagr/polybar/wiki/Module:-script)

### Workspaces

![workspaces](https://i.imgur.com/hXJGOjR.png)

The default `i3` module is used here (its wiki [page](https://github.com/jaagr/polybar/wiki/Module:-i3))

### Spotify (custom)
![spotify](https://i.imgur.com/FxVeJ4c.png)

### Weather (custom)
![weather](https://i.imgur.com/Q2NSroy.png)

### Filesystem

[Wiki page](https://github.com/jaagr/polybar/wiki/Module:-filesystem)

![filesystem](https://i.imgur.com/vp3PGBV.png)

### Backlight
![backlight](https://i.imgur.com/Nu5u8p8.png)

The default `backlight` module is used here (its wiki [page](https://github.com/jaagr/polybar/wiki/Module:-backlight))

Use the following command to list available cards:

```sh
$ ls -1 /sys/class/backlight/
```
### Volume

[Wiki page](https://github.com/jaagr/polybar/wiki/Module:-volume)

![volume](https://i.imgur.com/mFldkIA.png)

### Cpu

[cpu](https://github.com/jaagr/polybar/wiki/Module:-cpu)

![cpu](https://i.imgur.com/AmcHHWX.png)

### Cpu temperature

[wiki page](https://github.com/jaagr/polybar/wiki/Module:-temperature)

![cpu-temp](https://i.imgur.com/KuXhpNG.png)

### Ram

[wiki page](https://github.com/jaagr/polybar/wiki/Module:-memory)

![ram](https://i.imgur.com/E1lc5BZ.png)

### Network traffic

[wiki page](https://github.com/jaagr/polybar/wiki/Module:-network)

![net-traffic](https://i.imgur.com/5UsuYEK.png)

### Arch packages to update (custom)
![arch](https://i.imgur.com/Gc8FYcP.png)

### Battery
![battery](https://i.imgur.com/RwNi4kA.png)

### Date and time

[wiki page](https://github.com/jaagr/polybar/wiki/Module:-date)

![date](https://i.imgur.com/tYNRqhs.png)

### Keyboard layout

[wiki page](https://github.com/jaagr/polybar/wiki/Module:-xkeyboard)

![key-layout](https://i.imgur.com/R5dX2WB.png)

### Power module (custom)
![power](https://i.imgur.com/ke2Fa3w.png)
![power](https://i.imgur.com/Z7YSD8r.png)

### Tray icons

![tray](https://i.imgur.com/5nVepYL.png)