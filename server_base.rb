dep 'java', :template => 'managed' do

  installs {
    via :apt,    "openjdk-7-jre"
    via :pacman, "jre7-openjdk-headless"
  }
end

dep 'git', :template => 'managed' do
  installs {
    via :apt,    "git-all"
    via :pacman, "git"
  }
end

dep 'build tools', :template => 'managed' do
  installs "build-essential"
  provides 'gcc'
end

dep 'rsync', :template => 'managed'
dep 'htop', :template => 'managed'


dep 'server base' do
  requires 'java',
    'git',
    # 'build tools',
    'ruby',
    'mongodb.managed',
    'rsync',
    'elasticsearch',
    'htop',
    'passenger gem'
end
