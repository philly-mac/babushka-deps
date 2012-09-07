dep 'monitor server' do
  requires 'server base',
    'backup',
    'graylog2 server',
    'user private key'.with(:user => 'philip')
    'jenkins',
end
