dep 'java', :template => 'managed' do
  installs "openjdk-7-jre"
end

dep 'git', :template => 'managed' do
  installs "git-all"
end

dep 'build tools', :template => 'managed' do
  installs "build-essential"
  provides 'gcc'
end


dep 'server base' do
  requires 'java',
    'git',
    'build tools',
    'ruby',
    'mongodb'
end
