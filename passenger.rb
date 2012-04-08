dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3', "rbfuify philip bashrc"

  met? do
    File.exists?("/usr/local/rbfu/rubies/1.9.3/lib/ruby/gems/bin/passenger")
  end

  meet do
    log_shell "Installing passenger", "su - philip -c \"bash -l -c 'rbfu @1.9.3 gem install passenger -v 3.0.11'\""
  end

  after do
    cd "/usr/local/rbfu/rubies/1.9.3/lib/ruby/gems/gems/passenger-3.0.11/ext/boost" do
      patch_file = "#{babushka_root}/patches/libstdcpp3.hpp.patch"
      shell "patch -Np1 < #{patch_file}"
      log_shell "Setting permissions on rbfu", "chown -Rf philip:users /usr/local/rbfu"
    end
  end
end

