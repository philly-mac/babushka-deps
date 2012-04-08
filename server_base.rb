dep 'java', :template => 'managed' do
  installs "jre7-openjdk-headless"
end

dep 'rsync', :template => 'managed'
dep 'curl', :template => 'managed'
dep 'grep', :template => 'managed'
dep 'pcre', :template => 'managed'
dep 'postfix', :template => 'managed'
dep 'htop', :template => 'managed'
dep 'git', :template => 'managed'
dep 'mongodb', :template => 'managed' do
  provides 'mongod'
end

dep 'mongodb auto start' do
  met? { service_installed?('mongodb') }
  meet { mod_service('mongodb') }
end

dep 'linux-lts', :template => 'managed' do
  provides []
end

dep 'server base' do
  requires 'linux-lts',
    'sudo.managed',
    'mongodb',
    'mongodb auto start',
    'rsync',
    'grep',
    'pcre',
    'curl',
    'htop',
    'git',
    'java',
    'ruby',
    'elasticsearch',
    'passenger gem',
    'nginx',
    'iptables config',
    'postfix',
end
