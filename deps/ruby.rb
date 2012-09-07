dep "ruby 1.9.3" do
  met? { shell?("rvm 1.9.3") }

  meet do
    log_shell "Installing ruby 1.9.3", "rvm install 1.9.3"
  end
end

dep 'ruby' do
  requires 'curl', 'git', 'ruby 1.9.3'
end
