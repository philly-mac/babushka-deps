dep 'mail-server-01' do
  requires 'server base',
    'backup cron'.with(:hour => 3, :minute => 0),
    'backup conf'.with(:server => 'mail-server-01'),
    'postfix server config',
    'monit conf app'.with(:app_name => 'sshd'),
    'monit conf app'.with(:app_name => 'postfix')
end
