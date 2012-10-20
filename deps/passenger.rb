dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3'

  met? { which("passenger") }
  meet { log_shell "Installing passenger", "gem install passenger" }
end

