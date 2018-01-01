haproxy_pkg:
  pkg.installed:
    - pkgs:
      - openssl
      - haproxy

/etc/default/haproxy:
  file.managed:
    - source: salt://files/haproxy
    - user: root
    - group: root
    - require:
      - pkg: haproxy_pkg

/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://files/haproxy.cfg
    - user: root
    - group: root
    - template: jinja
    - require:
      - pkg: haproxy_pkg

haproxy:
  service:
    - running
    - reload: True
    - require:
      - file: /etc/default/haproxy
      - file: /etc/haproxy/haproxy.cfg
