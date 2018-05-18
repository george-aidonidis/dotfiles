# Helpful scripts
<!-- TOC depthFrom:2 -->

- [Polybar](#polybar)
- [Screens](#screens)
- [Scripts on root folder](#scripts-on-root-folder)

<!-- /TOC -->
Various script to ease automating tasks or gather functions to use globally. Please note that most of them will not suit your needs and that you will have to modify them.

## Polybar

So far there are some scripts that polybar uses to display information. They belong to the custom configuration part of it (more [here](https://github.com/jaagr/polybar/wiki/Module:-script))

* archupdates: Will display number of system updates (both official and community)
* openweathermap-simple-icon: Displays a relevant icon depending on weather
* openweathermap-simple-text: Displays temperature
* spotify: Displays current sond and artist

## Screens

This folder contains scripts that will use xrandr commands to disable the specified screen. Please note that this is configured for type-c connection to an external connection. You should modify them if that is not your connection type (or extend it if you have more monitors :)

## Scripts on root folder

The rest of the scripts are used for a few tasks such as:

* Screen capturing (either screenshot or screen casting), changing the keyboard layout (gr & en), locking, toggling the camera etc...
