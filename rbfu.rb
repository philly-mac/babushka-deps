dep 'ruby-build' do
  met? { File.exists?('/usr/local/bin/ruby-build') }
  meet do
    cd '/tmp' do
      log_shell "Fetching ruby-build", "git clone https://github.com/sstephenson/ruby-build.git" if !File.exists?("ruby-build") || !File.directory?("ruby-build")
      cd 'ruby-build' do
        shell './install.sh'
      end
    end
  end
end

dep 'rbfu' do
  met? { File.exists?('/usr/local/bin/rbfu') }
  meet do
    cd '/tmp' do
      log_shell "Fetching rbfu", "git clone https://github.com/philly-mac/rbfu.git" if !File.exists?("rbfu") || !File.directory?("rbfu")
      cd 'rbfu' do
        shell './install.sh'
      end
    end
  end
end

dep 'rbfu inited' do
  profile = '$HOME/.profile'.p
  eval_cmd = 'eval "$(rbfu --init)"'

  met? do
    profile.grep eval_cmd
  end

  meet do
    profile.append(eval_cmd)
  end
end