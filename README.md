# ODOO MODULE TUTORIAL

Example on how to build a module based on Odoo v10.

[build a module based on v10]: https://www.odoo.com/documentation/10.0/howtos/backend.html

[![Travis-CI](https://img.shields.io/travis/vonpupp/odoo10-buildout-archlinux.svg)](https://travis-ci.org/vonpupp/odoo10-buildout-archlinux)
[![Coveralls Status](https://coveralls.io/repos/vonpupp/odoo10-buildout-archlinux/badge.svg)](https://coveralls.io/r/vonpupp/odoo10-buildout-archlinux)
[![Scrutinizer](https://img.shields.io/scrutinizer/g/vonpupp/odoo10-buildout-archlinux.svg)](https://scrutinizer-ci.com/g/vonpupp/odoo10-buildout-archlinux/)
[![Stories in Ready](https://badge.waffle.io/vonpupp/odoo10-buildout-archlinux.png?label=ready&title=Ready)](http://waffle.io/vonpupp/odoo10-buildout-archlinux)
[![Stories in progress](https://badge.waffle.io/vonpupp/odoo10-buildout-archlinux.png?label=progress&title=Progress)](http://waffle.io/vonpupp/odoo10-buildout-archlinux)

Throughput Graph

[![Throughput Graph](https://graphs.waffle.io/vonpupp/odoo10-buildout-archlinux/throughput.svg)](https://waffle.io/vonpupp/odoo10-buildout-archlinux/metrics)


## Creating a development environment using virtualbox

```sh
# Bootstrap packages
./provision/bootstrap-packages-archlinux.sh

# Bootstrap database
./provision/bootstrap-database.sh

# Create a virtualenv locally
./provision/bootstrap-environment.sh

# Start odoo
bin/start_odoo

# Open the browser
firefox 0.0.0.0:8069
```

## Creating a module using mrbob odoo templates

```sh
# Create a virtual env
virtualenv2 .venv
source .venv/bin/activate

# Install bob templates
(.venv) > $ pip2 install bobtemplates.odoo

# Create a basic addon manifest
(.venv) > $ mrbob bobtemplates.odoo:addon

--> Addon name (with underscores): todo_kanban
--> Is it an OCA addon [n]: n
--> Summary: Kanban board for to-do tasks.
--> Version [10.0.1.0.0]:
--> Copyright holder name: vonpupp
--> Copyright year: 2017
--> Website:

# Restart the server
> $ bin/start_odoo

# Update the apps via the web interface
# Install the new app


# Create a model skeleton for the app
(.venv) > $ cd todo_kanban
(.venv) todo_kanban > $ mrbob bobtemplates.odoo:model

--> Odoo version (8|9|10) [10]: 10
--> Model name (dotted notation): todo.task
--> Inherit [y]: y
--> Form view [y]: y
--> Search view [y]: y
--> Tree view [y]: y
--> Action and menu entry [y]: y
--> ACL [y]: y
--> Demo data [y]: y
--> Copyright holder name: vonpupp
--> Copyright year: 2017


# Create tests skeleton for the app
(.venv) todo_kanban > $ mrbob bobtemplates.odoo:test

--> Odoo version (8|9|10) [10]: 10
--> Test file name (with underscores): test_kanban
--> Copyright holder name: vonpupp
--> Copyright year: 2017

```

## Updating the module

```sh
# Update a specific module
bin/start_odoo -d $(whoami) -u todo_app --stop-after-init

# Unit test a specific app using
bin/start_odoo -d $(whoami) -i todo_app --test-enable
```

## Debug

```sh
# Local debug
# Use ipdb as usual or start odoo with the logfile param
bin/start_odoo --logfile=~/odoospam.log

# Remote debug

# Source: http://stackoverflow.com/a/29451814
# Install epdb on the remote host
pip install epdb

# REMOTE: Add a break point
import epdb; epdb.serve()

# LOCAL: Attach
python -c "import epdb; epdb.connect()"
```


## Roadmap

List of desirable features on this repo (out of the scope of the book):

- [X] Use buildout
- [X] Travis
- [X] Add code quality
- [X] Add bob templates
- [X] Add maintainer quality tools
- [ ] Add documentation (sphinx)
- [ ] Add UML
- [ ] HTML5 layer on top of the JSONRPC API
- [ ] Learn commit style (https://www.odoo.com/documentation/10.0/reference/guidelines.html#git)
- [ ] Use odoo-bin
- [ ] Deploy
- [ ] Functional test
- [ ] Learn to user openupgrade (OCA)?
- [ ] Tests with runbot?
- [ ] Review: Add coverage (problems with MQT)
- [ ] Review: Docker (problem with dbus and systemd)
- [ ] Review: Use watchdog (without watchdog XML files automatically reloaded, code is not)
