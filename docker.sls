{% set version = salt['grains.get']('oscodename', '???') %}  {# 'xenial', 'trusty', etc #}
{% set osver = salt['grains.get']('osrelease_info', [0, 0]) %} {# Ubuntu 14.04 would be [14, 04] #}
{% set unamer = salt['grains.get']('kernelrelease') %} {# uname -r #}

{# Docker #}
{% if osver[0] >= 16 %}  {# xenial and above has the docker.io package #}
docker:
    pkg.installed:
        - name: docker.io
{% else %}
docker_prereqs:
    pkg.installed:
        - pkgs:
            - apt-transport-https
            - ca-certificates
            - linux-image-extra-{{ unamer }}

docker:
    pkgrepo.managed:
        - humanname: Docker Container Engine
        - name: deb https://apt.dockerproject.org/repo ubuntu-{{ version }} experimental
        - file: /etc/apt/sources.list.d/docker.list
        - keyserver: hkp://p80.pool.sks-keyservers.net:80
        - keyid: 2C52609D
        - require_in:
            - pkg: docker
    pkg.installed:
        - name: docker-engine
        - refresh: True
{% endif %}
{# end of Docker stuff #}

