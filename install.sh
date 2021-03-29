# Install SDK and Runtimes
sudo flatpak --system remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak -y --system install flathub org.gnome.Sdk/x86_64/3.38


# Remove old flatpak of this, if installed
rm *.flatpak repo/ -r 2>/dev/null
flatpak remove org.geany.Geany -y 2>/dev/null


# Build
flatpak-builder --force-clean build-dir org.geany.Geany.yml 


# Create flatpak
flatpak-builder --repo="repo" --force-clean build-dir/ org.geany.Geany.yml 
flatpak --user remote-add --no-gpg-verify "org.geany.Geany" "repo"
#flatpak build-bundle "repo" "org.geany.Geany_$date.flatpak" org.geany.Geany stable --runtime-repo="https://flathub.org/repo/flathub.flatpakrepo"
flatpak build-bundle "repo" "org.geany.Geany.flatpak" org.geany.Geany stable

# Install
flatpak --user install org.geany.Geany.flatpak -y
