# dotfiles :computer:

[![Build Status](https://travis-ci.org/george-aidonidis/dotfiles.svg?branch=master)](https://travis-ci.org/george-aidonidis/dotfiles)

<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [dotfiles :computer:](#dotfiles-computer)
	- [Programs whose configs can be found here](#programs-whose-configs-can-be-found-here)
	- [Important notice](#important-notice)
	- [How to setup](#how-to-setup)
	- [Other readmes](#other-readmes)

<!-- /TOC -->

<p>
  <img width="360" src="https://i.imgur.com/VTnWo90.jpg">
  <img width="360" src="https://i.imgur.com/znVqAjp.jpg">
</p>
<p>
  <img width="360" src="https://i.imgur.com/TaJkpL9.jpg">
  <img width="360" src="https://i.imgur.com/EktZI6L.jpg">
</p>

Personal dotfiles that I use for my Thinkpad t470s (running [swaywm](https://swaywm.org/) or [i3wm](https://i3wm.org/)).

## Programs whose configs can be found here

+ [i3 (i3-gaps)](https://github.com/Airblader/i3)
+ [NeoVim](https://neovim.io/)
+ [oh-my-zsh](http://ohmyz.sh/)
+ [tmux](https://github.com/tmux/tmux)
+ [ranger](https://github.com/ranger/ranger)
+ [dunst](https://github.com/dunst-project/dunst)
+ [redshift](https://github.com/jonls/redshift)
+ [polybar](https://github.com/jaagr/polybar)
+ [compton](https://github.com/chjj/compton)
+ [rofi](https://github.com/DaveDavenport/rofi)
+ And many, many little scripts I use

## Important notice

* It would be best to have a basic knowledge of how a linux ecosystem works since this repository works mostly as a reference/configuration project instead of a guide. I will not go into detail explaining what each program does but I will try to point you to the right direction in case you would like to learn more.
* Please, do not blindly run or copy paste everything you find :upside_down_face:
* I would really appreciate if you have a suggestion or report an error to open an [issue](https://github.com/george-aidonidis/dotfiles/issues).

## How to setup

[Stow](http://www.gnu.org/software/stow/) is used to help settings things up (instead of manually creating symlinks etc...). In that way you can have a `dotfiles` folder in your `$HOME` folder instead of hacking around on version controlling (like adding root folder and ignoring everything non relevant).

----
Naive script that installs :poop: (please, read its contents before running since it's going to overwrite things)
Check contents of script [here](./install.sh)

```sh
$ bash ./install.sh
```

## Other readmes

* [Scripts](/scripts/readme.md)
* [i3](/i3/.config/i3/readme.md)
* [polybar](/polybar/.config/polybar/readme.md)
* [ranger](/ranger/.config/ranger/readme.md)
