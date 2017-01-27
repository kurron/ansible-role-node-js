Role Name
=========

Node.js.

Requirements
------------

TODO

Role Variables
--------------

* node_install: true
* node_install_lts: true
* node_install_current: false

Dependencies
------------

* kurron.base

Example Playbook
----------------

```
- hosts: servers
  roles:
      - { role: kurron.node-js, node_install_lts: false, node_install_current: true }
```

License
-------

This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).

Author Information
------------------

[Author's website](http://jvmguy.com/).
