dep 'sudo',         :template => 'managed'
dep 'rsync',        :template => 'managed'
dep 'tmux',         :template => 'managed'
dep 'curl',         :template => 'managed'
dep 'grep',         :template => 'managed'
dep 'htop',         :template => 'managed'
dep 'git',          :template => 'managed'
dep 'radicale',     :template => 'managed'
dep "vim",          :template => "managed"


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
  installs "imagemagick", "libgraphicsmagick1-dev"
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

dep "server base" do
  requires 'sudo'
  system_users.each {|user| requires 'user create'.with(:user => user)}
  requires 'curl',
    'grep',
    'tmux',
    'htop',
    'rsync',
    'ack',
    'git',
    'time zone'.with(:zone => 'Europe/Berlin'),
    'email forward'.with(:user_dir => '/root', :email => root_mail_forwarder),
    # push id_rsa/idrsa.pub keys to server
    'sshd configure'.with(:allowed_users => system_users.join(', ')),
    'graylog2 rsyslog config'
end
