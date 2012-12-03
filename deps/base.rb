dep 'sudo.managed'
dep 'rsync.managed'
dep 'tmux.managed'
dep 'curl.managed'
dep 'grep.managed'
dep 'htop.managed'
dep 'git.managed'
dep "vim",          :template => "managed"

dep 'syslog-ng.managed'
dep 'openvpn.managed'

dep 'rsyslog', :template => "managed" do
  provides ['rsyslogd']
end

dep "redis server",      :template => "managed" do
  installs 'redis-server'
  provides ['redis-server']
end

dep "mongodb", :template => "managed" do
  provides ['mongod', 'mongo']
end

dep 'imagemagick',  :template => 'managed' do
  # installs "imagemagick",
  #   "libgraphicsmagick1-dev",
  #   "graphicsmagick-libmagick-dev-compat"
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
  requires 'sudo.managed'
  system_users.to_a.each {|user| requires 'user create'.with(:user => user)}
  requires 'curl.managed',
    'grep.managed',
    'tmux.managed',
    'htop.managed',
    'rsync.managed',
    'git.managed',
    'ack',
    'time zone'.with(:zone => 'Europe/Berlin'),
    'email forward'.with(:user_dir => '/root', :email => root_mail_forwarder),
    # push id_rsa/idrsa.pub keys to server
    'sshd configure'.with(:allowed_users => system_users.to_a.join(', '),
    'hosts add'.with(:host_names => 'db-server-01',      :ip_address => '10.0.3.10'),
    'hosts add'.with(:host_names => 'db-server-02',      :ip_address => '10.0.3.11'),
    'hosts add'.with(:host_names => 'app-server-01',     :ip_address => '10.0.3.20'),
    'hosts add'.with(:host_names => 'app-server-02',     :ip_address => '10.0.3.21'),
    'hosts add'.with(:host_names => 'monitor-server-01', :ip_address => '10.0.3.30'),
    'hosts add'.with(:host_names => 'search-server-01',  :ip_address => '10.0.3.40')
    'hosts add'.with(:host_names => 'mail-server-01',    :ip_address => '10.0.3.50'),
  )
end
