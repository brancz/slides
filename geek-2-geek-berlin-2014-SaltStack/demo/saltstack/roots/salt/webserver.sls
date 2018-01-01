openssl:
  pkg:
    - installed

apache2:
  pkg:
    - installed

/var/www/html/index.html:
  file.managed:
    - source: salt://files/index.html
    - user: root
    - group: root
    - template: jinja
    - require:
      - pkg: apache2
