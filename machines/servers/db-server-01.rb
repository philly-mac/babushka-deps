dep 'db-server-01' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'postgresql server',
    'mongodb',
    'redis server',
    'graylog2 rsyslog config',
    'memcached.managed',
    'monit conf app'.with(:app_name => 'sshd',       :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'postgresql', :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'mongodb',    :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'redis',      :group_email_address => group_email_address)
end
