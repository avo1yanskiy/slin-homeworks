apache role
=========

Роль для установки Kibana на хостах с ОС: Debian, Ubuntu, CentOS, RHEL.

Requirements
------------

Поддерживаются только ОС семейств debian и EL.

Role Variables
--------------

| Variable name | Default | Description |
|-----------------------|----------|-------------------------|
| apache | "7.14.1" | Параметр, который определяет какой версии apache будет установлен |

Example Playbook
----------------

    - hosts: all
      roles:
         - { role: apache }

License
-------

BSD

Author Information
------------------

Aleksandr Volyanskiy