def vim_users
  [['root',''], ['philip','/home']]
end

dep "vim", :template => "managed"

dep "vimify users" do

  bash_include = "[[ -e \"$HOME/.bash/include\" ]] && source $HOME/.bash/include"

  met? do
    vim_users.all? do |user|
      path = "#{user.last}/#{user.first}"
      "#{path}/.bashrc".p.grep(bash_include)
    end
  end

  meet do
    vim_users.each do |user|
      path = "#{user.last}/#{user.first}"

      cd "#{path}" do
        unless "#{path}/.bashrc".p.grep(bash_include)
          log_shell "vimifying #{user.first}","#{path}/.bashrc".p.append(bash_include)
        end
      end
    end
  end
end

dep "vim config" do
  requires 'vim', 'git', 'vimify users'

  met? do
    vim_users.all? do |user|
      "#{user.last}/#{user.first}/.bash".p.exist?
    end
  end

  meet do
    vim_users.each do |user|
      cd "#{user.last}/#{user.first}" do
        log_shell "Getting dotfiles for #{user.first}", "git clone git://github.com/philly-mac/dot-files.git .bash"
      end
    end
  end
end