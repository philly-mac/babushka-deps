dep 'monit', :template => 'managed'

dep 'monit auto start' do
  met? { service_installed?('monit') }
  meet { mod_service('monit') }
end

dep "monit conf" do
  requires "monit"

  met? { babushka_config?('/etc/monit/sshd_config') }
  meet do
    '/etc/ssh/sshd_config'.p.copy('/etc/ssh/sshd_config.backup')
    render_erb 'sshd/sshd_config.erb', :to => '/etc/ssh/sshd_config'
  end
  after { shell 'rc.d restart sshd' }
end