dep 'app-server-02' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'backup cron'.with(:hour => 1, :minute => 0),
    'backup conf'.with(:server => 'app-server-02'),
    # 'imagemagick',
    'libxml2',
    'libxslt',
    'postgresql client',
    'passenger gem',
    'nginx from passenger',
    'redis lib',
    'monit conf app'.with(:app_name => 'sshd',            :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'passenger_nginx', :group_email_address => group_email_address)
end