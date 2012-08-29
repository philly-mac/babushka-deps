dep 'ronaldo server' do
  requires 'server base',
    'ruby',
    'passenger gem',
    'nginx',
    'java',
    'imagemagick',
    'libxml2',
    'libxslt',
    'backup',
    'graylog2 client'
end
