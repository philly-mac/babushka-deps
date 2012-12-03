dep 'root-server' do

  group_email_address = 'philip@ivercore.com'

  requires    'server base'.with(:system_users => ['philip'], :root_mail_forwarder => 'philip@ivercore.com'),
    'time zone'.with(:zone => 'Europe/Berlin'),
    'backup cron'.with(:hour => 0, :minute => 0),
    'backup conf'.with(:server => 'root-server'),
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
    'openvpn',
    'mongodb',
    'postfix client config',
    'monit conf app'.with(:app_name => 'nginx',   :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'sshd',    :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'apache',  :group_email_address => group_email_address),
    'monit conf app'.with(:app_name => 'openvpn', :group_email_address => group_email_address)
end