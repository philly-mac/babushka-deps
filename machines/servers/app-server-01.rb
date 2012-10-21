# encoding: utf-8

dep 'app-server-01' do
  requires 'server base',
    'backup cron'.with(:hour => 1, :minute => 0),
    'backup conf'.with(:server => 'app-server-01'),
    # 'imagemagick',
    'libxml2',
    'libxslt',
    'postgresql client',
    'ruby',
    'passenger gem',
    'nginx from passenger',
    'redis lib',
    'graylog2 client',
    'postfix client config',
    'monit conf app'.with(:app_name => 'sshd'),
    'monit conf app'.with(:app_name => 'passenger_nginx')
end
