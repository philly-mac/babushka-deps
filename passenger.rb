dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3'

  met? do
    File.exists?("/usr/local/rbfu/rubies/1.9.3/bin/passenger")
  end

  meet do
    log_shell "Installing passenger", "/usr/local/rbfu/rubies/1.9.3/bin/gem install passenger", :as => 'philip'
  end
end