dep 'java', :template => 'managed' do
  installs "jre7-openjdk-headless"
end

dep 'rsync', :template => 'managed'
dep 'htop', :template => 'managed'
dep 'git', :template => 'managed'
dep 'mongodb', :template => 'managed' do
  provides 'mongod'
end

dep 'mongodb auto start' do
  met? { service_installed?('mongodb') }
  meet { mod_service('mongodb') }
end

dep 'server base' do
  requires 'sudo.managed',
    'mongodb',
    'rsync',
    'htop',
    'git',
    'java',
    'ruby',
    'elasticsearch',
    'passenger gem'
end
