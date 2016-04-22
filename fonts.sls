/usr/local/share/fonts/ttf:
    file.recurse:
        - name: /usr/local/share/fonts/ttf
        - source: salt://files/fonts/ttf
        - file_mode: 0644
        - dir_mode: 755
    cmd.wait:
        - name: '/usr/bin/fc-cache -f'
        - watch:
            - file: /usr/local/share/fonts/ttf

