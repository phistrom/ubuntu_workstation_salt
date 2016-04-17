trillian:
    pkgrepo.managed:
        - humanname: Trillian Instant Messenger
        - name: deb http://www.trillian.im/get/linux/2.0/apt stable main
        - file: /etc/apt/sources.list.d/trillian.list
        - key_url: https://www.trillian.im/get/linux/2.0/apt/trillian.key
    pkg.latest:
        - refresh: True
        - require:
            - pkgrepo: trillian

