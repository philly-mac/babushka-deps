[['1.8.7','1.8.7-p352'], ['1.9.3', '1.9.3-p0']].each do |ruby|

  dep "ruby #{ruby.first}" do
    met? do
      File.exists?("/usr/local/rbfu/rubies/#{ruby.first}")
    end

    unless  File.exists?("/usr/local/rbfu/rubies/#{ruby.first}")
      log_shell "Installing ruby #{ruby.first}", "ruby-build #{ruby.last} /usr/local/rbfu/rubies/#{ruby.first}"
    end
  end

end


dep 'ruby' do
  requires 'git',
    'rbfu',
    'ruby-build',
    'ruby 1.9.3',
    'ruby 1.8.7'
end