dep 'monitor-server-01' do
  requires 'server base',
    'backup cron'.with(:hour => 3, :minute => 30),
    'backup conf'.with(:server => 'monitor-server-01'),
    'graylog2 server',
    'jenkins.managed',
    'postfix client config',
    'monit conf app'.with(:app_name => 'sshd'),
    'monit conf app'.with(:app_name => 'graylog2-server'),
    'monit conf app'.with(:app_name => 'jenkins'),
    'mmonit'

end
