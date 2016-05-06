/home/phillip/.bashrc:
    file.managed:
        - source: salt://files/.bashrc
        - user: phillip
        - group: phillip
        - template: jinja

