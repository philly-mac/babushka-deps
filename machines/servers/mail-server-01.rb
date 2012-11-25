dep 'mail-server-01' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'backup cron'.with(:hour => 3, :minute => 0),
    'backup conf'.with(:server => 'mail-server-01'),
    'postfix server config',
    'monit conf app'.with(:app_name => 'sshd',    :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'postfix', :group_email_address => group_email_address)
end
