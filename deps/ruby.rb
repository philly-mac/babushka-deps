def ruby_version
  "ruby-1.9.3-p194"
end

dep "ruby 1.9.3" do

  path = "/usr/local/bin/ruby".p
  met? { path.exist? }

  meet do
    cd "/tmp" do
      log_shell "Downloading ruby 1.9.3", "wget -c http://ftp.ruby-lang.org/pub/ruby/1.9/#{ruby_version}.tar.gz"
      log_shell "Unpacking ruby 1.9.3", "tar -xzf #{ruby_version}.tar.gz"
      cd ruby_version do
        log_shell "compiling ruby 1.9.3", "./configure --prefix=/usr/local; make; make install"
      end
    end
  end
end

dep 'ruby' do
  requires 'curl', 'git', 'ruby 1.9.3'
end
