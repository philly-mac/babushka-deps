dep 'IverCore-1' do
  requires 'user philip',
    'sudoers',
    'user fabian',
    'server base',
    'ruby 1.8.7',
    'sshd configure'.with(:allowed_users => 'philip git fabian'),
    'sshd auto start'
    # 'radicale'

end
