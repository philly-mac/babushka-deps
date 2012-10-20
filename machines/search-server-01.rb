dep 'search-server-01' do
  requires 'server base',
    'backup cron'.with(:hour => 4, :minute => 0),
    'backup conf'.with(:server => 'search-server-01'),
    'elasticsearch',
    'postfix client config',
    'monit conf app'.with(:app_name => 'sshd'),
    'monit conf app'.with(:app_name => 'elasticsearch')
end
