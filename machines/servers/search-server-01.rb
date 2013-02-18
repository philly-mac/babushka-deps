# encoding: utf-8

dep 'search-server-01' do
  requires    'server base'.with(:system_users => system_users, :root_mail_forwarder => group_email_address),
    'elasticsearch',
    'postfix client config',
    'graylog2 rsyslog config',
    'monit conf app'.with(:app_name => 'sshd',          :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'elasticsearch', :group_email_address => group_email_address)
end
