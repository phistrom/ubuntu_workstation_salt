openssh-server:
    pkg.latest: []
    service.running:
        - name: ssh

ssh_server_key_bits_2048:
    file.replace:
        - name: /etc/ssh/sshd_config
        - pattern: ServerKeyBits 1024
        - repl: ServerKeyBits 2048
        - require:
            - pkg: openssh-server
        - watch_in:
            - service: openssh-server

ssh_server_usedns_no:
    file.replace:
        - name: /etc/ssh/sshd_config
        - pattern: UseDNS\s+yes
        - repl: UseDNS no
        - flags:
            - 'IGNORECASE'
        - append_if_not_found: True
        - require:
            - pkg: openssh-server
        - watch_in:
            - service: openssh-server

