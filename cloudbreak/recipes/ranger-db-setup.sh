#/bin/bash

postgres='postgres'
dbname='ranger'
rangerdba='rangeradmin'
passwd='rangeradmin'

postgres_dir='/var/lib/pgsql'
postgres_jdbc_driver='/usr/share/java/postgresql-jdbc.jar'
pg_ctl='/usr/bin/pg_ctl'


cd $postgres_dir

echo "CREATE DATABASE $dbname;" | sudo -u $postgres psql -U postgres
echo "CREATE USER $rangerdba WITH PASSWORD '$passwd';" | sudo -u $postgres psql -U postgres
echo "GRANT ALL PRIVILEGES ON DATABASE $dbname TO $rangerdba;" | sudo -u $postgres psql -U postgres

ambari-server setup --jdbc-db=postgres --jdbc-driver=$postgres_jdbc_driver

cat >> "$postgres_dir/data/pg_hba.conf" <<EOF
local  all  ambari,rangeradmin,rangerlogger trust
host   all  ambari,rangeradmin,rangerlogger 0.0.0.0/0	trust
host   all  ambari,rangeradmin,rangerlogger ::/0	trust
EOF

cd $postgres_dir && sudo -u postgres $pg_ctl -D "$postgres_dir/data" reload
