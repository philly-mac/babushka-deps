dep 'IverCore-1' do
  requires 'user philip',
    'sudoers',
    'user fabian',
    'server base',
    'sshd configure'.with(:allowed_users => 'philip git fabian'),
    'sshd auto start'
    # 'radicale'

end
