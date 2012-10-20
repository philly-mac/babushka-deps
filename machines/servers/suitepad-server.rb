# ssh, web, openvpn, monit-web, alt-ssh, proxmox web
dep 'suitepad-server' do
  requires 'server base',
    'backup cron'.with(:hour => 0, :minute => 0),
    'backup conf'.with(:server => 'suitepad-server'),
    'nginx.managed',
    'iptables config',
    'openvpn',
    'mongodb',
    'postfix client config',
    'monit conf app'.with(:app_name => 'nginx'),
    'monit conf app'.with(:app_name => 'sshd'),
    'monit conf app'.with(:app_name => 'apache'),
    'monit conf app'.with(:app_name => 'openvpn')
end
