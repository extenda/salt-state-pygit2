{% set clone_dir = "/opt/libgit2" %}
{% set build_dir = clone_dir ~ "/_cmake" %}

libgit2-install-requirements:
  pkg.installed:
    - pkgs:
      - git
      - make
      - automake
      - gcc
      - gcc-c++
      - kernel-devel
      - libffi-devel
      - cmake
      - openssl-devel
      - libssh2-devel
      - python-devel

libgit2-clone-source:
  git.latest:
    - name: https://github.com/libgit2/libgit2
    - target: {{ clone_dir }}
    - depth: 1
    - rev: v0.26.0
    - force_reset: True 

libgit2-build-dir:
  file.directory:
    - name: {{ build_dir }}

libgit2-cmake:
  cmd.run:
    - name: cmake ..
    - cwd: {{ build_dir }}

libgit2-make:
  cmd.run:
    - name: make -j4
    - cwd: {{ build_dir }}
    - creates: {{ build_dir }}/libgit2.so

libgit2-make-install:
  cmd.run:
    - name: make install
    - cwd: {{ build_dir }}
    - creates: /usr/local/lib/libgit2.so

libgit2-ldconfig:
  cmd.run:
    - name: ldconfig
    - onchanges:
      - cmd: libgit2-make-install

libgit2-linked-global:
  file.managed:
    - name: /etc/ld.so.conf.d/local-lib.conf
    - contents: "/usr/local/lib"
