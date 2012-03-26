dep 'java', :template => 'managed' do
  installs "openjdk-7-jre"
end

dep 'server base' do
  requires 'java'
end
