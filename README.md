# ODOO BUILDOUT ARCHLINUX

Example on how to build a buildout environment based on Odoo v10


## Creating a development environment using virtualbox

```sh
# Bootstrap packages
./provision/bootstrap-packages-archlinux.sh

# Bootstrap database
./provision/bootstrap-database.sh

# Create a virtualenv locally
./provision/bootstrap-buildout.sh

# Start odoo
bin/start_odoo

# Open the browser
firefox localhost:8069
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
