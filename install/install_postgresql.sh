#!/bin/bash
# Copyright (c) 2016. Zuercher Hochschule fuer Angewandte Wissenschaften
# All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# Author: Martin Skoviera

# install postgresql
sudo apt-get install postgresql

# create user
sudo -u postgres createuser ubuntu

# change password and create database
sudo -u postgres psql <<EOF
\x
ALTER USER ubuntu WITH PASSWORD 'pass1234';
CREATE DATABASE ruleengine WITH OWNER ubuntu;
CREATE DATABASE coin_cdr WITH OWNER ubuntu;
CREATE DATABASE coin_bill WITH OWNER ubuntu;
CREATE DATABASE cloudstack WITH OWNER ubuntu;
CREATE DATABASE openstackevents WITH OWNER ubuntu;
CREATE DATABASE ceilometer WITH OWNER ubuntu;
EOF

# restart postgresql
sudo service postgresql restart