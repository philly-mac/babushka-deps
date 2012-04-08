dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3', "rbfuify philip bashrc"

  met? do
    File.exists?("/usr/local/rbfu/rubies/1.9.3/bin/passenger")
  end

  meet do
    log_shell "Installing passenger", "source #{babushka_root}/rbfu/rbfu-init; gem install passenger", :as => 'philip'
  end
end