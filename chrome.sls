google-chrome:
    pkg.installed:
        - sources:
            - google-chrome-stable: https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

/home/phillip/.config/autostart/hangouts.desktop:
    file.symlink:
        - target: /home/phillip/.gnome/apps/chrome-knipolnnllmklapflnccelgolnpehhpl-Default.desktop
        - require:
            - pkg: google-chrome

