dep 'postgresql client', :template => 'managed' do
  met? { '/usr/include/postgresql/libpq'.p.exist? }

  installs 'libpq-dev'
end

dep 'postgresql server',   :template => 'managed' do
  met? {'/usr/lib/postgresql/9.1/bin/postgres'.p.exist? }

  installs 'postgresql'
end