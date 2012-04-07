def ensure_rbfu_directories
  shell "mkdir -p /usr/local/rbfu/src"
  shell "mkdir -p /usr/local/rbfu/rubies"
  shell "chown -Rf philip:users /usr/local/rbfu"
end

def run_as(user, commands, message = nil)
  commands = [commands] if commands.is_a?(String)
  commands.each do |command|
    if message
      log_shell message, "sudo su #{user}; #{command}"
    else
      shell "sudo su -l #{user}; #{command}; exit"
    end
  end
end

dep "ruby 1.8.7" do
  met? do
    File.exists?("/usr/local/rbfu/rubies/1.8.7")
  end

  meet do
    ensure_rbfu_directories

    cd "/usr/local/rbfu/src" do
      shell "wget http://ftp.ruby-lang.org/pub/ruby/ruby-1.8.7-p358.tar.bz2 -O ruby.tar.bz2", :as => 'philip'
      shell "tar -xjf ruby.tar.bz2", :as => 'philip'
      cd "ruby-1.8.7-p358" do
        patch_file = "#{File.dirname(__FILE__)}/patches/ruby1.8-fix.patch"
        run_as 'philip',[
          "patch -Np1 < ${srcdir}/fix.patch",
          "./configure --prefix=/usr/local/rbfu/rubies/1.8.7; make; make install"
        ]
      end
    end
  end
end

dep "ruby 1.9.3" do
  met? do
    File.exists?("/usr/local/rbfu/rubies/1.9.3")
  end

  meet do
    ensure_rbfu_directories
    run_as 'philip', "ruby-build 1.9.3-p0 /usr/local/rbfu/rubies/1.9.3", "Installing ruby 1.9.3"
  end
end

dep 'ruby' do
  requires 'git',
    'rbfu',
    'ruby-build',
    'ruby 1.9.3',
    'ruby 1.8.7'
end