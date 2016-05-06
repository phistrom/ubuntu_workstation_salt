python_deps:
    pkg.installed:
        - pkgs:
            - build-essential
            - lib32z1-dev
            - libjpeg-dev
            - libmysqlclient-dev
            - libpq-dev
            - libxml2-dev
            - libxslt1-dev
            - python-pip
            - python3-pip
            - python-dev
            - python3-dev
            - python-virtualenv
            - python3-virtualenv
            - python-setuptools
            - python3-setuptools
            - zlib1g-dev

python_modules:
    pip.installed:
        - requirements: salt://files/requirements.txt
        - require:
            - pkg: python_deps
            - pkg: redis-server

python3_modules:
    pip.installed:
        - bin_env: /usr/bin/pip3
        - use:
            - pip: python_modules
        - require:
            - pkg: python_deps
            - pkg: redis-server

