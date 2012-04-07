def ensure_rbfu_directories
  shell "mkdir -p /usr/local/rbfu/src"
  shell "mkdir -p /usr/local/rbfu/rubies"
  shell "chown -Rf philip:users /usr/local/rbfu"
end

dep "ruby 1.8.7" do
  met? do
    File.exists?("/usr/local/rbfu/rubies/1.8.7")
  end

  meet do
    ensure_rbfu_directories

    cd "/usr/local/rbfu/src" do
      shell "wget http://ftp.ruby-lang.org/pub/ruby/ruby-1.8.7-p358.tar.bz2 -O ruby.tar.bz2", :as => 'philip'
      cd "ruby-1.8.7-p358" do
        patch_file = "#{File.dirname(__FILE__)}/patches/ruby1.8-fix.patch"
        shell "patch -Np1 < ${srcdir}/fix.patch", :as => 'philip'
        shell "./configure --prefix=/usr/local/rbfu/rubies/1.8.7; make; make install", :as => 'philip'
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
    shell "Installing ruby 1.9.3", "ruby-build 1.9.3-p0 /usr/local/rbfu/rubies/1.9.3", :as => 'philip'
  end
end

dep 'ruby' do
  requires 'git',
    'rbfu',
    'ruby-build',
    'ruby 1.9.3',
    'ruby 1.8.7'
end