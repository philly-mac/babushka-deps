dep 'haproxy-server-01' do
  requires 'server base',
    'backup cron'.with(:hour => 2, :minute => 30),
    'backup conf'.with(:server => 'haproxy-server-01'),
    'postfix client config',
    'monit conf app'.with(:app_name => 'sshd')
end
