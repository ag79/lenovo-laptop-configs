# Ubuntu on Lenovo Legion laptop

Scripts and configs to fix common problems on Linux and Lenovo Legion 5 (dual GPU: integrated AMD + Nvidia), e.g. 15arh05h and similar.

Instructions and files below were tested and work on Kubuntu 21.04.


## 1. Fix screen tearing in multi-monitor setups

Tearing typically happens on the screen connected to Nvidia card (HDMI port on Legion 5) and can be fixed by forcing composition pipeline on it. Unfortunately, ticking the checkbox in `nvidia-settings` doesn't make it persistent. There are a few solutions to this:

### 20-nvidia-antitear.conf

Put this in `/etc/X11/xorg.conf.d/` to force composition pipeline and fix screen tearing on the screen connected to Nvidia card.

Source: [https://forums.developer.nvidia.com/t/how-to-save-the-x-server-settings/128896/2](URL)

### nvidia-forcecompositionpipeline.sh

Does the same as the above, but can be used e.g. in desktop environment's startup programs (KDE Plasma: System Settings - Startup and Shutdown - Autostart) or on-demand. No root required.

Source: [https://unix.stackexchange.com/questions/510757/how-to-automatically-force-full-composition-pipeline-for-nvidia-gpu-driver](URL)


## 2. Use battery conservation feature

### battery-conservation-*.service

Enables Lenovo battery conservation control via systemd. Should work on many Lenovo laptops based on Ideapad platform, including Legion etc. Root required.

Installation:

  * Put `battery-conservation-*.service` files in `/etc/systemd/system/`

Usage - set default behaviour (will be set every time on startup):

  * Run `systemctl enable battery-conservation-on` if you want conservation mode enabled on system startup.
  * Run `systemctl enable battery-conservation-off` if you want conservation mode turned off on startup.
  * Do not have both enabled at the same time!
  * Run `systemctl disable battery-conservation-xxx` to undo the "run on startup" behaviour of respective service.

Usage - toggle setting on demand (startup setting remains as is):

  * To enable battery conservation: `systemctl start battery-conservation-on`
  * To disable battery conservation: `systemctl start battery-conservation-off`
  * In this scenario the services are mutually exclusive and will stop their counterparts when started.


## 3. Fix touchpad not working

**Already fixed in Ubuntu 21.04 (kernels around version 5.11+).**

May be needed on Ubuntu 20.10 and earlier (kernel around 5.8). Use `sudo legion-touchpad-fix.sh` or create a systemd service based on it.


## Other helpful repos:

* A command line tool to toggle battery conservation feature: [https://github.com/schinfo/lenopow](URL)
* A similar collection, includes AMDGPU Brightness Fix: [https://github.com/antony-jr/lenovo-legion5-15arh05-scripts](URL)

