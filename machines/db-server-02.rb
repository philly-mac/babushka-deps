dep 'db-server-02' do
  requires 'server base',
    'backup cron'.with(:hour => 2, :minute => 0),
    'backup conf'.with(:server => 'db-server-02'),
    'graylog2 rsyslog config',
    'postgresql server',
    'postfix client config',
    'monit conf app'.with(:app_name => 'sshd'),
    'monit conf app'.with(:app_name => 'postgresql')
end
