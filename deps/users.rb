dep "user create", :user do

  requires 'sudo'

  met? { '/etc/passwd'.p.grep(/^#{user}/) }

  meet do
    key = "#{babushka_root}/public-keys/#{user}.id_rsa.pub"

    shell "useradd -m -g #{user} -G admin -s /bin/bash #{user}"
    shell "echo \"#{user}:password\"|chpasswd"
    shell "mkdir /home/#{user}/.ssh"
    shell "touch /home/#{user}/.ssh/authorized_keys"
    shell "cat #{key} >> /home/#{user}/.ssh/authorized_keys"
  end

  after do
    shell "chmod 700 /home/#{user}/.ssh"
    shell "chmod 600 -Rf /home/#{user}/.ssh/*"
    shell "chown -Rf #{user}:#{user} /home/#{user}/.ssh"
  end
end

dep 'user www' do
  requires 'group www'

  met? do
    '/etc/passwd'.p.grep(/^www/)
  end

  meet do
    shell "useradd -g www --system www"
  end
end

dep 'group www' do
  met? do
    '/etc/group'.p.grep(/^www/)
  end

  meet do
    shell "useradd --system www"
  end
end

dep 'user add to group', :user, :group do
  met? { shell?("id #{user} shell | egrep '\(#{group}\)'") }

  meet do
    log_shell "Adding #{user} to #{group}", "usermod -a -G #{group} #{user}"
  end
end

dep "user bashify", :user, :home_base do

  path = "#{home_base}/#{user}"
  bash_include = "[[ -e \"$HOME/.bash/include\" ]] && source $HOME/.bash/include"

  requires "bash config".with(:user => user, :home_dir => path)

  met? do
    "#{path}/.bashrc".p.exist? && "#{path}/.bashrc".p.grep(bash_include)
  end

  meet do
    cd "#{path}" do
      unless "#{path}/.bashrc".p.grep(bash_include)
        log_shell "vimifying #{user}","#{path}/.bashrc".p.append("\n#{bash_include}")
      end
    end
  end

end

dep "bash config", :user, :home_dir do
  requires 'vim', 'git'

  met? { "#{home_dir}/.bash".p.exist? }

  meet do
    cd "#{home_dir}" do
      log_shell "Getting dotfiles for #{user}", "git clone git://github.com/philly-mac/dot-files.git .bash"
    end
  end

  after do
    unless user == 'root'
      log_shell "Setting permissions on #{home_dir}/.bash for #{user}", "chown -Rf #{user}:#{user} #{home_dir}/.bash"
    end
  end

end

dep 'user private key', :user do

  met? { "/home/#{user}/.ssh/id_rsa".p.exist? }

  meet do
    shell "ssh-keygen", :as => user
  end
end
