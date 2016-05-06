{% set latest_pycharm = "2016.1.2" %}

pycharm-installer:
    archive.extracted:
        - name: /opt/
        - source: https://download.jetbrains.com/python/pycharm-professional-{{ latest_pycharm }}.tar.gz
        - source_hash: https://download.jetbrains.com/python/pycharm-professional-{{ latest_pycharm }}.tar.gz.sha256
        - archive_format: tar
        - if_missing: /opt/pycharm-{{ latest_pycharm }}
    file.symlink:
        - name: /usr/local/bin/pycharm
        - target: /opt/pycharm-{{ latest_pycharm }}/bin/pycharm.sh
        - require:
            - archive: pycharm-installer
