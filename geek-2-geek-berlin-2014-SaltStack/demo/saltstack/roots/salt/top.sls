base:
  '*':
    - vim
  'roles:webserver':
    - match: grain
    - webserver
  'roles:loadbalancer':
    - match: grain
    - loadbalancer
