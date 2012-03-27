require 'FileUtils'

dep 'java', :template => 'managed' do
  installs "openjdk-7-jre"
end

dep 'git', :template => 'managed' do
  installs "git-all"
end



dep 'server base' do
  requires 'java',
    'git',
    'ruby',
    'mongodb'
end
