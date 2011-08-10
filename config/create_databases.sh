#!/bin/bash
mysql -uroot -S/tmp/mysql.sock -phar526 <<-EOT
        DROP DATABASE IF EXISTS vr_test;
        CREATE DATABASE vr_test;
EOT


mysql -uroot -S/tmp/mysql1.sock <<-EOT
        DROP DATABASE IF EXISTS vr_austin;
        CREATE DATABASE vr_austin;
EOT

mysql -uroot -S/tmp/mysql3.sock <<-EOT
        DROP DATABASE IF EXISTS vr_dallas;
        CREATE DATABASE vr_dallas;
EOT

RAILS_ENV=test rake db:migrate
RAILS_ENV=fiveruns_city_austin_test_master rake db:migrate
RAILS_ENV=fiveruns_city_dallas_test_master rake db:migrate
exit 0
