#!/bin/bash

bundle install

rake db:create
rake db:migrate
rake redmine:plugins:migrate
