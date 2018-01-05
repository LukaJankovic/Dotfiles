# Dotfiles

![1](https://github.com/LukaJankovic/Dotfiles/raw/master/2.png)

## Install

Run `./dotdrop.sh install`.

## Controlling terminal (URxvt) window

Alt + Left click = move

Alt + Right click, drag = resize

## Other 

Super + Space = rofi (like spotlight on macOS)

Super + Enter = center

Super + T = new terminal

## Emacs plugins

* evil
* evil-snipe
* avy
* ace-window
* multiple-cursors
* neotree

## Music

The `music.sh` script is used to fetch music from dbus and is used by polybar in a custom script. Currently supports spotify and google play music desktop. If your player doesn't work add your player to the array at the top of the script. Plex media player isn't pushing music info to dbus and will therefore not work.
