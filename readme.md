# dotfiles :computer:

<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Programs whose configs can be found here](#programs-whose-configs-can-be-found-here)
- [Important notice](#important-notice)
- [How to setup](#how-to-setup)
- [Other readmes](#other-readmes)

<!-- /TOC -->

![screenshot](https://i.imgur.com/q9PPaZZ.jpg)

Personal dotfiles that I use for my thinpad E570 (running two screens).

## Programs whose configs can be found here

+ i3 (i3-gaps)
+ NeoVim
+ zsh
+ tmux
+ ranger
+ dunst (for notifications)
+ redshift
+ polybar
+ redshift (to adjust color temperature of the screens)
+ compton (For transparency and to stop screen tearing)
+ rofi (To replace dmenu)
+ And many, many little scripts I use

## Important notice

* It would be best to have a basic knowledge of how a linux ecosystem works since this repository works mostly as a reference/configuration project instead of a guide. I will not go into detail explaining what each program does but I will try to point you to the right direction in case you would like to learn more.
* Please, do not blindly run or copy paste everything you find :upside_down_face:
* I would really appreciate if you have a suggestion or report an error to open an [issue](https://github.com/george-aidonidis/dotfiles/issues).

## How to setup

Stow is used to help settings things up (instead of manually creating symlinks etc...). In that way you can have a `dotfiles` folder in your `$HOME` folder instead of hacking around on version controlling (like adding root folder and ignoring everything non relevant).

----
Naive script that installs :poop: (please, read its contents before running since it's going to overwrite things)
Check contents of script [here](./install.sh)

```sh
$ chmod +x install.sh
$ ./install.sh
```

## Other readmes

* [Scripts](/scripts/readme.md)
* [i3](/i3/.config/i3/readme.md)
* [polybar](/polybar/.config/polybar/readme.md)
