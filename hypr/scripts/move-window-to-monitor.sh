#!/bin/bash
direction=$1

case $direction in
    left)
        hyprctl dispatch movewindow mon:l
        ;;
    right)
        hyprctl dispatch movewindow mon:r
        ;;
    up)
        hyprctl dispatch movewindow mon:u
        ;;
    down)
        hyprctl dispatch movewindow mon:d
        ;;
esac
