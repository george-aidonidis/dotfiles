#!/bin/bash

perl ~/dotfiles/scripts/i3subscribe.pl window | while read -r event; do
    i3-msg '[class="^.*"] border pixel 0';
    i3-msg 'border pixel 1';
done
