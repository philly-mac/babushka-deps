dep 'db-server-01' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'backup cron'.with(:hour => 1, :minute => 30),
    'backup conf'.with(:server => 'db-server-01'),
    'postgresql server',
    'mongodb',
    'redis server',
    'monit conf app'.with(:app_name => 'sshd',       :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'postgresql', :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'mongodb',    :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'redis',      :group_email_address => group_email_address)
end
