#!/bin/bash
# Lenovo Legion 5 touchpad enable on old kernels (~5.8)
# Not needed on newer kernels since around ~5.11
echo 386 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio386/direction
