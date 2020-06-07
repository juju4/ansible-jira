jira
====

[![Ansible Role](https://img.shields.io/ansible/role/3981.svg)](https://galaxy.ansible.com/list#/roles/3981)
[![Build Status - Master](https://travis-ci.org/juju4/ansible-jira.svg?branch=master)](https://travis-ci.org/juju4/ansible-jira)

Installs JIRA.

Requirements
------------

This role requires Ansible 1.6 or higher.

Role Variables
--------------

| Name                    | Default                                                          | Description                 |
|-------------------------|------------------------------------------------------------------|-----------------------------|
| jira_version            | 7.13.14                                                          | Version of JIRA to install  |
| jira_archive_sha256sum  | 561e2de0b4ecc8411d407706d29aa215107f9cfec9915e941f378850586c909e | SHA 256 checksum of archive |
| jira_jvm_minimum_memory | 384m                                                             | JIRA JVM minimum memory     |
| jira_jvm_maximum_memory | 768m                                                             | JIRA JVM maximum memory     |

Dependencies
------------

- geerlingguy.java

Example Playbook
----------------

Install JIRA
```
- hosts: all
  roles:
    - { role: juju4.jira }
```

Install JIRA specifying version
```
- hosts: all
  roles:
    - { role: juju4.jira, jira_version: 8.5.5, jira_archive_sha256sum: 2928a7a3c2d114308898f62416a4b10a99fa94624adaea8fce8311d70f9ba681 }
```

Install JIRA specifying JIRA JVM memory
```
- hosts: all
  roles:
    - { role: juju4.jira, jira_jvm_minimum_memory: 3000m, jira_jvm_maximum_memory: 4096m }
```

FAQ
---

See also [juju4.jira2](https://github.com/juju4/ansible-jira2/) to complement jira with reverse-proxy, smarthostclient and other settings

License
-------

BSD

Author Information
------------------

Juju4 - Current maintainer
Kevin Brebanov - Initial role, currently deprecated
