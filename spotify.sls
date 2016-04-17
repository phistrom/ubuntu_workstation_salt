spotify-client:
    pkgrepo.managed:
        - humanname: Spotify Music Player
        - name: deb http://repository.spotify.com stable non-free
        - file: /etc/apt/sources.list.d/spotify.list
        - keyserver: hkp://keyserver.ubuntu.com:80
        - keyid: BBEBDCB318AD50EC6865090613B00F1FD2C19886
    pkg.latest:
        - refresh: True
        - require:
            - pkgrepo: spotify-client

