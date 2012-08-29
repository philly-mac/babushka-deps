def babushka_root
  @babushka_root ||= File.dirname(__FILE__)
end

dep 'rsync',        :template => 'managed'
dep 'tmux',         :template => 'managed'
dep 'curl',         :template => 'managed'
dep 'grep',         :template => 'managed'
dep 'postfix',      :template => 'managed'
dep 'htop',         :template => 'managed'
dep 'git',          :template => 'managed'
dep 'radicale',     :template => 'managed'
dep "vim",          :template => "managed"

dep 'imagemagick',  :template => 'managed' do
  installs "imagemagick", "libmagickcore-dev"
end

dep 'java', :template => 'managed' do
  installs "openjdk-7-jre"
end

dep 'libxslt', :template => 'managed' do
  installs 'libxslt1-dev'
end

dep 'libxml2', :template => 'managed' do
  installs "libxml2-dev"
end

dep "server base" do
  requires 'sudo.managed',
    "user create".with(:user => 'philip'),
    "user bashify".with(:user => 'root', :home_base => ''),
    "user bashify".with(:user => 'philip', :home_base => '/home'),
    'curl',
    'grep',
    'tmux',
    'htop',
    'rsync',
    'ack',
    'git',
    'email forward'.with(:user_dir => '/root', :email => 'philip@ivercore.com'),
    'sshd configure'.with(:allowed_users => 'philip')
end
