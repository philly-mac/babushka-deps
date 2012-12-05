dep 'app-server-01' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    # 'imagemagick',
    'libxml2',
    'libxslt',
    'postgresql client',
    'passenger gem',
    'nginx from passenger',
    'redis lib',
    'graylog2 rsyslog config',
    'graylog2 client'.with(:site_hostname => 'ivercore.com'),
    'monit conf app'.with(:app_name => 'sshd',            :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'passenger_nginx', :group_email_address => group_email_address)
end
