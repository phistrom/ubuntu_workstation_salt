{# need Java for PyCharm #}
webupd8-repo:
    pkgrepo.managed:
        - humanname: WebUpd8 Oracle Java PPA repository
        - ppa: webupd8team/java

{# Adapted from a gist by renoirb on Github. https://gist.github.com/renoirb/6722890 #}
oracle-license-select:
  cmd.run:
    - unless: which java
    - name: '/bin/echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections'
    - require_in:
      - cmd: oracle-license-seen-lie

oracle-license-seen-lie:
    debconf.set:
        - data:
            'shared/accepted-oracle-license-v1-1': {'type': 'boolean', 'value': True}
        - require_in:
            - pkg: oracle-java8-installer

oracle-java8-installer:
    pkg.latest:
        - refresh: True
        - require:
            - pkgrepo: webupd8-repo
            - debconf: oracle-license-seen-lie
{# end of Java stuff #}

