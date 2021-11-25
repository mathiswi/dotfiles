# my dotfiles

* WIP 
* i3 & polybar
* Credits to most of the polybar and rofi config go to [adi1090x](https://github.com/adi1090x/polybar-themes)


## Themes

* Mostly Nord
* GTK Arc-Dark ([https://github.com/horst3180/arc-theme](https://github.com/horst3180/arc-theme))


## Grub theme

Change `GRUB_TIMEOUT=10` in  `/etc/default/grub` to 2. 

```
git clone https://github.com/vinceliuice/grub2-themes.git ~/grub2-themes && \
sudo ~/grub2-themes/install.sh -t slaze -s 4k && \
sudo update-grub
```


## Greeter wallpaper

```
sudo mkdir /etc/lightdm/wallpaper/ && \
sudo cp ~/config/wallpaper.jpg /etc/lightdm/wallpaper/wallpaper.jpg
```
Change wallpaper in `/etc/lightdm/slick-greeter.conf`

```
background = /etc/lightdm/wallpaper/wallpaper.jpg
```


## Spotify themes

[All Spicetify themes](https://github.com/morpheusthewhite/spicetify-themes/wiki/Themes-preview)
```
yay -S spicetify-cli spicetify-themes-git && \
sudo chmod a+wr /opt/spotify && \
sudo chmod a+wr /opt/spotify/Apps -R && \
spicetify && \
spicetify backup apply enable-devtool && \
spicetify config current_theme Sleek && \
spicetify config color_scheme nord && \
spicetify apply
```

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


