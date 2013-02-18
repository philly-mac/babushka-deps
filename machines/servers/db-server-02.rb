# encoding: utf-8

dep 'db-server-02' do
  requires    'server base'.with(:system_users => system_users, :root_mail_forwarder => group_email_address),
    'postgresql server',
    'postfix client config',
    'graylog2 rsyslog config',
    'memcached.managed',
    'monit conf app'.with(:app_name => 'sshd',       :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'postgresql', :group_email_address => group_email_address)
end
