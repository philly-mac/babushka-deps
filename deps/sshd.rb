dep 'sshd configure', :allowed_users do

  path = "/etc/ssh/sshd_config"

  met? { Bab.generated_config?(path) }

  meet do
    if allowed_users.set?
      path.p.copy('/etc/ssh/sshd_config.backup')
      BabFile.render_erb_template "/sshd/sshd_config.erb", :to => path
    end
  end
end