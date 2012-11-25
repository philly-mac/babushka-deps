dep 'monitor-server-01' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'backup cron'.with(:hour => 3, :minute => 30),
    'backup conf'.with(:server => 'monitor-server-01'),
    'graylog2 server',
    'jenkins.managed',
    'postfix client config',
    'monit conf app'.with(:app_name => 'sshd',            :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'graylog2-server', :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'jenkins',         :group_email_address => group_email_address),
    'mmonit'

end
