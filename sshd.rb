dep 'sshd configure', :allowed_users do

  met? { babushka_config?('/etc/ssh/sshd_config') }
  meet do
    '/etc/ssh/sshd_config'.p.copy('/etc/ssh/sshd_config.backup')
    render_erb 'ssh/sshd_config', :to => '/etc/ssh/sshd_config'
  end
  after { shell 'rc.d sshd restart' }
end