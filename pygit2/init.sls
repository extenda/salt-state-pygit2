{% from "pygit2/os-map.jinja" import packages with context %}

include:
  - .libgit2

pygit2-python-pip:
 pkg.installed:
   - name: {{ packages.pip }}
   - reload_modules: True

pygit2-installed:
  pip.installed:
    - name: pygit2 == v0.26.0

pygit2-shell-loader:
  cmd.run:
    - name: ldconfig -v
