# encoding: utf-8

dep 'root-server' do
  requires    'server base'.with(:system_users => system_users, :root_mail_forwarder => group_email_address),
    'tmux conf'.with(:user => 'root'),
    'time zone'.with(:zone => 'Europe/Berlin'),
    'backup cron',
    'backup conf',
    'nginx.managed',
    'iptables config'.with(
      :config => [
        {:type => :append, :protocol => 'icmp', :state => 'NEW,ESTABLISHED,RELATED', :icmp_type => '8', :match => 'state'},
        {:type => :append, :dport => 22},
        {:type => :append, :dport => 80},
        {:type => :append, :dport => 1194, :protocol => 'udp'},
        {:type => :append, :dport => 2899},
      ]
    ),
    'mongodb',
    'graylog2 rsyslog config',
    'monit conf app'.with(:app_name => 'nginx',   :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'sshd',    :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'apache',  :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'openvpn', :group_email_address => group_email_address)
end