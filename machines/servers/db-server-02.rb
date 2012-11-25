dep 'db-server-02' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'backup cron'.with(:hour => 2, :minute => 0),
    'backup conf'.with(:server => 'db-server-02'),
    'graylog2 rsyslog config',
    'postgresql server',
    'postfix client config',
    'monit conf app'.with(:app_name => 'sshd',       :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'postgresql', :group_email_address => group_email_address)
end
