# encoding: utf-8

dep 'mail-server-01' do
  requires    'server base'.with(:system_users => system_users, :root_mail_forwarder => group_email_address),
    'postfix server config',
    'graylog2 rsyslog config',
    'monit conf app'.with(:app_name => 'sshd',    :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'postfix', :group_email_address => group_email_address)
end
