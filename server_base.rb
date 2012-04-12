dep 'imagemagick',  :template => 'managed'
dep 'libxml2',      :template => 'managed'
dep 'libxslt',      :template => 'managed'
dep 'postgresql',   :template => 'managed'
dep 'rsync',        :template => 'managed'
dep 'tmux',         :template => 'managed'
dep 'curl',         :template => 'managed'
dep 'grep',         :template => 'managed'
dep 'postfix',      :template => 'managed'
dep 'htop',         :template => 'managed'
dep 'git',          :template => 'managed'

dep 'mongodb', :template => 'managed' do
  provides 'mongod'
end

dep 'pcre', :template => 'managed' do
  provides []
end

dep 'java', :template => 'managed' do
  installs "jre7-openjdk-headless"
end

dep 'mongodb auto start' do
  met? { service_installed?('mongodb') }
  meet { mod_service('mongodb') }
end

dep 'postfix auto start' do
  requires 'postfix'
  met? { service_installed?('postfix') }
  meet { mod_service('postfix') }
end

dep 'linux-lts', :template => 'managed' do
  provides []
end

dep 'forward email', :user_dir, :email do
  path = "#{user_dir}/.forward"

  met? { path.p.exists? }
  meet { shell "echo #{email} > #{path}" }
end

root forward

dep 'server base' do
  requires 'linux-lts',
    'sudo.managed',
    'mongodb',
    'mongodb auto start',
    'rsync',
    'grep',
    'pcre',
    'curl',
    'tmux',
    'htop',
    'git',
    'java',
    'imagemagick',
    'libxml2',
    'libxslt',
    'postgresql',
    'ruby',
    'passenger gem',
    'nginx',
    'iptables config',
    'postfix auto start',
    'forward email'.with(:user_dir => '/root', :email => 'philip@ivercore.com')
    "vim config",
    'backup',
end
