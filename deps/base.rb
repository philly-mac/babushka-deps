dep 'curl.managed'
dep 'git.managed'
dep 'grep.managed'
dep 'htop.managed'
dep 'memcached.managed'
dep 'nginx.managed'
dep 'openvpn.managed'
dep 'rsync.managed'
dep 'sudo.managed'
dep 'syslog-ng.managed'
dep 'vim.managed'


dep "mongodb", :template => "managed" do
  provides ['mongod', 'mongo']
end

dep 'imagemagick',  :template => 'managed' do
 installs "imagemagick",
   "libgraphicsmagick1-dev",
   "graphicsmagick-libmagick-dev-compat",
   "libmagickwand-dev"
end

dep 'java', :template => 'managed' do
  installs "openjdk-7-jre"
end

dep 'libxslt', :template => 'managed' do
  met? { '/usr/include/libxslt'.p.exist? }
  installs 'libxslt1-dev'
end

dep 'libxml2', :template => 'managed' do
  met? { "/usr/include/libxml2".p.exist? }

  installs "libxml2-dev"
end

dep "server base", :system_users, :root_mail_forwarder do
  requires 'sudo.bin'
  system_users.to_a.each {|user| requires 'user create'.with(:user => user)}
  requires 'curl.managed',
    'grep.managed',
    'htop.managed',
    'rsync.managed',
    'git.managed',
    'sudoers',
    'ack',
    'email forward'.with(:user_dir => '/root', :email => root_mail_forwarder),
    'sshd configure'.with(:allowed_users => system_users.to_a.join(', ')),
    'hosts add'.with(:host_names => 'db-server-01',      :ip_address => '10.0.3.10'),
    'hosts add'.with(:host_names => 'db-server-02',      :ip_address => '10.0.3.11'),
    'hosts add'.with(:host_names => 'app-server-01',     :ip_address => '10.0.3.20'),
    'hosts add'.with(:host_names => 'app-server-02',     :ip_address => '10.0.3.21'),
    'hosts add'.with(:host_names => 'monitor-server-01', :ip_address => '10.0.3.30'),
    'hosts add'.with(:host_names => 'search-server-01',  :ip_address => '10.0.3.40'),
    'hosts add'.with(:host_names => 'mail-server-01',    :ip_address => '10.0.3.50')
    'hosts add'.with(:host_names => 'amqp-server-01',    :ip_address => '10.0.3.60')
end
