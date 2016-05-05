{% set version = salt['grains.get']('oscodename', '???') %}  {# 'xenial', 'trusty', etc #}
{# Postgresql #}
postgresql:
    pkgrepo.managed:
        - humanname: PostgreSQL Server
        - name: deb http://apt.postgresql.org/pub/repos/apt/ {{ version }}-pgdg main
        - file: /etc/apt/sources.list.d/pgdg.list
        - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
        - require_in:
            - pkg: postgresql
    pkg.installed:
        - pkgs: 
            - postgresql-9.5
            - pgadmin3
        - refresh: True
    service.running: []
{# the following rules open postgres server ports up to public access #}
/etc/postgresql/9.5/main/postgresql.conf:
    file.replace:
        - repl: "listen_addresses = '*'"
        - pattern: "#?listen_addresses\\s+=\\s+'localhost'"
        - require:
            - pkg: postgresql
/etc/postgresql/9.5/main/pg_hba.conf:
    file.append:
        - text: "host all all 0.0.0.0/0 md5"
        - require:
            - pkg: postgresql
        - watch_in:
            - service: postgresql

postgresql-9.4:
    pkg.purged:
        - require_in:
            - pkg: postgresql
    
{# end of Postgresql #}

