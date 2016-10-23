#!/usr/bin/env ruby
#
# This file is licensed by SvenDowideit@docker.com.
# original source: https://docs.docker.com/engine/examples/postgresql_service/

require 'dockerfile-dsl'



file = dockerfile do
  from 'ubuntu'
  maintainer 'SvenDowideit@docker.com'

  run 'apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
       --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8'
  run %Q(echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main"\
         > /etc/apt/sources.list.d/pgdg.list)
  run 'apt-get update && apt-get install -y python-software-properties \
       software-properties-common postgresql-9.3 postgresql-client-9.3 \
       postgresql-contrib-9.3'

  user :postgres

  run %Q(/etc/init.d/postgresql start &&\
         psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
         createdb -O docker docker)
  run %Q(echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf)
  run %Q(echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf)

  expose 5432

  volume  ['/etc/postgresql', '/var/log/postgresql', '/var/lib/postgresql']

  cmd ['/usr/lib/postgresql/9.3/bin/postgres',
       '-D', '/var/lib/postgresql/9.3/main',
       '-c', 'config_file=/etc/postgresql/9.3/main/postgresql.conf']
end

puts file
