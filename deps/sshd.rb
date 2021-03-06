dep 'sshd configure', :allowed_users do

  path = "/etc/ssh/sshd_config"

  met? { generated_config?(path) }

  meet do
    if allowed_users.set?
      path.p.copy('/etc/ssh/sshd_config.backup')
      render_erb_template "/sshd/sshd_config.erb", :to => path, :allowed_users => allowed_users
    end
  end
end