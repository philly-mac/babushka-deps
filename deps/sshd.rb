dep 'sshd configure', :allowed_users do

  met? { babushka_config?('/etc/ssh/sshd_config') }
  meet do
    '/etc/ssh/sshd_config'.p.copy('/etc/ssh/sshd_config.backup')
    render_erb 'sshd/sshd_config.erb', :to => '/etc/ssh/sshd_config'
  end
  after { shell 'rc.d restart sshd' }
end

dep 'sshd auto start' do
  met? { service_installed?('sshd') }
  meet { mod_service('sshd') }
end