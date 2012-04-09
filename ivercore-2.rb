dep 'IverCore-2' do
  requires  'user philip',
    'sudoers',
    'server base',
    'sshd configure'.with(:allowed_users => 'philip git')
    'sshd auto start'
end