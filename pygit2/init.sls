{% set pip-package = {
    'CentOS': 'python2-pip',
    'Amazon': 'python27-pip',
}.get(grains.os) %}

include:
  - .libgit2

pygit2-python-pip:
 pkg.installed:
   - name: {{ pip-package }}
   - reload_modules: True

pygit2-installed:
  pip.installed:
    - name: pygit2 == v0.26.0
