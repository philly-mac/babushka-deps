dep 'mail-server-01' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'postfix server config',
    'graylog2 rsyslog config',
    'monit conf app'.with(:app_name => 'sshd',    :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'postfix', :group_email_address => group_email_address)
end
