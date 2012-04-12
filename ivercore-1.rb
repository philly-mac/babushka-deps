dep 'mysql', :template => 'managed'

dep 'IverCore-1' do
  requires 'user philip',
    'sudoers',
    'user fabian',
    'server base',
    'mysql',
    'ruby 1.8.7',
    'mysql',
    'sshd configure'.with(:allowed_users => 'philip git fabian'),
    'sshd auto start'
    # 'radicale'

end
