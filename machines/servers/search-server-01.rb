dep 'search-server-01' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'backup cron'.with(:hour => 4, :minute => 0),
    'backup conf'.with(:server => 'search-server-01'),
    'elasticsearch',
    'postfix client config',
    'graylog2 rsyslog config',
    'monit conf app'.with(:app_name => 'sshd',          :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'elasticsearch', :group_email_address => group_email_address)
end
