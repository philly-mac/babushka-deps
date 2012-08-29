dep 'proxmox host' do
  requires 'sudo.managed',
    'curl',
    'grep',
    'tmux',
    'htop',
    'rsync',
    'ack',
    'git',
    "user create".with(:user => 'philip'),
    "user bashify".with(:user => 'root', :home_base => ''),
    "user bashify".with(:user => 'philip', :home_base => '/home'),
    'iptables config'.with(:input_accept_list => [2901, 8006, 19999, 2812, 22, 2899, 80, 8080, 9418], :output_accept_list => [9418]),
    'sshd configure'.with(:allowed_users => 'philip')
end
