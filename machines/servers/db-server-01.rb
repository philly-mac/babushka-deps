dep 'db-server-01' do
  requires 'server base',
    'backup cron'.with(:hour => 1, :minute => 30),
    'backup conf'.with(:server => 'db-server-01'),
    'postgresql server',
    'mongodb',
    'redis server',
    'postfix client config',
    'monit conf app'.with(:app_name => 'sshd'),
    'monit conf app'.with(:app_name => 'postgresql'),
    'monit conf app'.with(:app_name => 'mongodb'),
    'monit conf app'.with(:app_name => 'redis')
end
