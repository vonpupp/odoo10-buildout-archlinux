#!/usr/bin/env bash

# Banco de dados
#sudo systemctl enable postgresql
#sudo systemctl restart postgresql
sudo -u postgres createuser --createdb $(whoami)
#createdb $(whoami)
