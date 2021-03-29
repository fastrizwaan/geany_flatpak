# geany_flatpak
## geany flatpak with working terminal emulator. 

#### issue with flathub org.geany.Geany
The flathub version cannot run programs (run f5 key) like the desktop version as it does not provide xterm and complains about `xterm not found`; and adding xterm to flatpak is a big PITA. Gnome-terminal also needs session-bus and system-bus to work inside flatpak which is considered security issue. Don't know why flatpak guys don't provide basic needs like wine and terminal emulators in flatpak Sdks.

 Fortunately XFCE4-Terminal works flawlessly.
 
 So let's build and install:
```
sudo flatpak --system remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak -y --system install flathub org.gnome.Sdk/x86_64/3.38
```

#### clone and build flatpak from yaml
```
git clone https://github.com/fastrizwaan/geany_flatpak
cd geany_flatpak

# build
flatpak-builder --force-clean build-dir org.geany.Geany.yml

# install 
flatpak-builder --user --install --force-clean build-dir org.geany.Geany.yml

# run
flatpak run org.geany.Geany
```

#### Build a flatpak bundle file from the above built repo:
```
flatpak-builder --repo="repo" --force-clean "build" org.geany.Geany.yml
flatpak --user remote-add --no-gpg-verify "scite" "repo"
flatpak build-bundle "repo" "org.geany.Geany.flatpak" org.geany.Geany  --runtime-repo="https://flathub.org/repo/flathub.flatpakrepo"

flatpak --user install org.geany.Geany.flatpak
flatpak run org.geany.Geany
```

