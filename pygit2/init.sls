include:
  - .libgit2

pygit2-python-pip:
 pkg.installed:
   - name: python2-pip
   - reload_modules: True

pygit2-installed:
  pip.installed:
    - name: pygit2 == v0.26.0
