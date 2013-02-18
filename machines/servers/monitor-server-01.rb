# encoding: utf-8

dep 'monitor-server-01' do
  requires    'server base'.with(:system_users => system_users, :root_mail_forwarder => group_email_address),
    'graylog2 server',
    'jenkins.managed',
    'postfix client',
    'words.managed',
    'graylog2 rsyslog config',
    'monit conf app'.with(:app_name => 'sshd',            :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'graylog2-server', :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'jenkins',         :group_email_address => group_email_address)
end
