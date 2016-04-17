pidgin:
    pkg.latest: []

{# autostart pidgin at login #}
/home/phillip/.config/autostart/pidgin.desktop:
    file.managed:
        - source: salt://files/pidgin.desktop
        - require:
            - pkg: pidgin

