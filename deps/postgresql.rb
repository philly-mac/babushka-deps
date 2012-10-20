UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';
DROP DATABASE template1;
CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';

dep 'postgresql client', :template => 'managed' do
  met? { '/usr/include/postgresql/libpq'.p.exist? }

  installs 'libpq-dev'
end

dep 'postgresql server',   :template => 'managed' do
  met? {'/usr/lib/postgresql/9.1/bin/postgres'.p.exist? }

  installs 'postgresql'
end