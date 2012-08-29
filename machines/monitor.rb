dep 'monitor server' do
  requires 'server base',
    'backup',
    'graylog2 server'
end
