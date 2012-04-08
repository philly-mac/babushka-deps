dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3', "rbfuify philip bashrc"

  met? do
    File.exists?("/usr/local/rbfu/rubies/1.9.3/bin/passenger")
  end

  meet do
    login_shell "gem install passenger", :as => 'philip'
  end
end