dep 'passenger gem', :template => 'gem' do
  requires 'ruby 1.9.3'

  met? { which("passenger") }

  meet { log_shell "Installing passenger", "rvm 1.9.3@global; gem install passenger" }

  after { shell "chown -Rf root:rvm /usr/local/rvm" }

end

