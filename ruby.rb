dep 'ruby' do
  requires 'git', 'rbfu', 'ruby-build'

  met? do
    File.exists?('/usr/local/rubies/versions/1.9.3') &&
      File.exists?('/usr/local/rubies/versions/1.8.7')
  end

  meet do
    [['1.8.7','1.8.7-p352'], ['1.9.3', '1.9.3-p0']].each do |ruby|
      unless  File.exists?("/usr/local/rbfu/rubies/#{ruby.first}")
        log_shell "Installing ruby #{ruby.first}", "ruby-build #{ruby.last} /usr/local/rbfu/rubies/#{ruby.first}"
      end
    end
  end
end