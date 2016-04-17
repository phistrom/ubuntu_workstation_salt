python_deps:
    pkg.installed:
        - pkgs:
            - build-essential
            - python-pip
            - python3-pip
            - python-dev
            - python3-dev
            - python-virtualenv
            - python3-virtualenv
            - python-setuptools
            - python3-setuptools
            - libpq-dev
            - libmysqlclient-dev

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

