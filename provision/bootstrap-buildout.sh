#!/usr/bin/env bash

# Create a virtualenv locally
virtualenv2 . --system-site-packages

# Upgrade and install buildbot
bin/pip2 install -U pip zc.buildout

# Create config files
#printf "[buildout]\n\nextends = https://raw.githubusercontent.com/odoo-brazil/odoo-brazil-buildout/10.0/default.cfg" > common.cfg
#printf "[buildout]\n\nextends = common.cfg" > buildout.cfg

# Run buildout
bin/buildout

