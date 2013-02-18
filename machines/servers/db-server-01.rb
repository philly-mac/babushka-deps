# encoding: utf-8

dep 'db-server-01' do
  requires    'server base'.with(:system_users => system_users, :root_mail_forwarder => group_email_address),
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
