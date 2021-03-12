# dotfiles

* WIP
* bspwm & polybar
* Credits to most of the polybar and rofi config go to [adi1090x](https://github.com/adi1090x/polybar-themes)
* Optimized for a 4k screen


## Themes

* Mostly Nord
* GTK Arc-Dark ([https://github.com/horst3180/arc-theme](https://github.com/horst3180/arc-theme))



## Grub

Change `GRUB_TIMEOUT=10` in  `/etc/default/grub` to 2. 

```
git clone https://github.com/vinceliuice/grub2-themes.git ~/grub2-themes && \
~/grub2-themes/install.sh --tela --4k 
```


## Greeter

```
sudo mkdir /etc/lightdm/wallpaper/ && \
sudo cp ~/wallpaper/wallpaper.jpg /etc/lightdm/wallpaper/wallpaper.jpg
```
Change wallpaper in `/etc/lightdm/slick-greeter.conf`

```
background = /etc/lightdm/wallpaper/wallpaper.jpg
```


## Spotify

[All Spicetify themes](https://github.com/morpheusthewhite/spicetify-themes/wiki/Themes-preview)
```
yay -S spicetify-cli spicetify-themes-git && \
sudo chmod a+wr /opt/spotify && \
sudo chmod a+wr /opt/spotify/Apps -R && \
spicetify && \
spicetify backup apply enable-devtool && \
spicetify config current_theme Pop-Dark && \
spicetify apply 
```

Using a 4k Bildschirm `sudo cp spotify.desktop /usr/share/applications/`

## Touchpad & Mouse Speed 
 
Add to `/usr/share/x11/xorg.conf.d/40-libinput.conf`
Touchpad:
```
Option "NaturalScrolling" "True"
Option "HorizontalScrolling" "False" 
```
Mouse:
```
Option "AccelProfile" "flat"
Option "AccelSpeed" "1.8"
```

## Fix Dual-Boot Timezone Bug
```
timedatectl set-local-rtc 1 --adjust-system-clock
```

# Dell XPS Specific

## Brightness (if not already applied with install script)

```
sudo pacman -S inotify-tools bc
```

Create Script for changing brightness
```
sudo cp xbacklightmon /usr/local/bin && \
sudo chown root:root /usr/local/bin/xbacklightmon && \
sudo chmod 755 /usr/local/bin/xbacklightmon
```
Enable Systemd Service 

```
sudo cp xbacklightmon.service /usr/lib/systemd/user
systemctl --user enable xbacklightmon.service
```

## Change Sleep to more efficient deep sleep
```
echo deep|sudo tee /sys/power/mem_sleep
```

