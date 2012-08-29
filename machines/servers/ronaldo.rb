dep 'ronaldo server' do
  requires 'server base',
    'imagemagick',
    'libxml2',
    'libxslt',
    'backup',
    'ruby',
    'passenger gem',
    'nginx',
    'user add to group'.with(:user => 'philip', :group => 'rvm')
    'java',
    'graylog2 client'
end
