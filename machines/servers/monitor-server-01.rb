dep 'monitor-server-01' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'graylog2 server',
    'jenkins.managed',
    'postfix client',
    'words.managed',
    'monit conf app'.with(:app_name => 'sshd',            :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'graylog2-server', :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'jenkins',         :group_email_address => group_email_address)
end
