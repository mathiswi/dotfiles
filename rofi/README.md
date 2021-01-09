# Rofi

* All WIP (haven't used this in a while)
  
## Websearch

```
sudo pacman -S surfraw
```
`S` to use custom search engine (set to google)

```
cp rofi-websearch.sh ~/.local/bin/rofi && \
chmod +x ~/.local/bin/rofi/rofi-websearch.sh
```

## Filesearch

```
sudo pacman -S mlocate
```
Put `VISUAL=/usr/bin/nano` and `EDITOR=/usr/bin/nano` into `/etc/enviroment` to change editor to nano instead of vim.
Add `@reboot /usr/bin/updatedb` to `sudo crontab -e`.  


Add to PRUNENAMES in `/etc/updatedb.conf`:
* node_modules
* .git
* .cache
* .vscode
* .serverlesss

Add to PRUNEPATHS in `/etc/updatedb.conf`:
* `/home/mathis/.config/Code`


## Commands


## Websearch
```
/home/mathis/.local/bin/rofi/rofi-websearch.sh
```

### Filesearch
```
xdg-open "$(locate home media | rofi -threads 0 -dmenu -i -p "websearch")"
```