# encoding: utf-8

dep 'app-server-01' do
  requires    'server base'.with(:system_users => system_users, :root_mail_forwarder => group_email_address),
    # 'imagemagick',
    'libxml2',
    'libxslt',
    'postgresql client',
    'nginx.managed',
    'redis lib',
    'graylog2 rsyslog config',
    'graylog2 client'.with(:site_hostname => 'ivercore.com'),
    'monit conf app'.with(:app_name => 'sshd',            :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'passenger_nginx', :group_email_address => group_email_address)
end
