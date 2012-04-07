dep 'java', :template => 'managed' do
  installs "jre7-openjdk-headless"
end

dep 'git', :template => 'managed' do
  installs "git"
end

dep 'build tools', :template => 'managed' do
  installs "build-essential"
  provides 'gcc'
end

dep 'rsync', :template => 'managed'
dep 'htop', :template => 'managed'
dep 'mongodb', :template => 'managed' do
  provides 'mongod'
end

dep 'server base' do
  requires 'sudo.managed',
    'mongodb',
    'rsync.managed',
    'htop.managed',
    'git.managed',
    'java',
    'ruby',
    'elasticsearch',
    'passenger gem'
end
