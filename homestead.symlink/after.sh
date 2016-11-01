#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

php /home/vagrant/Code/ffframe.com/artisan migrate

php /home/vagrant/Code/manivelle/backend/artisan migrate

php /home/vagrant/Code/telecommande/artisan migrate

php /home/vagrant/Code/archives.nte.qc.ca/artisan migrate
