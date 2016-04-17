nginx:
    pkgrepo.managed:
        - ppa: nginx/development
    pkg.latest:
        - refresh: True
        - require:
            - pkgrepo: nginx

