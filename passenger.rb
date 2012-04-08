dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3', "rbfuify philip bashrc"

  met? do
    File.exists?("/usr/local/rbfu/rubies/1.9.3/lib/ruby/gems/bin/passenger")
  end

  meet do
    log_shell "Installing passenger", "su - philip -c \"bash -l -c 'rbfu @1.9.3 gem install passenger'\""
  end
end