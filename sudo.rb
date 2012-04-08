dep 'sudoers' do
  regex = "%wheel\\sALL=\\(ALL\\)\\sALL"
  path = '/etc/sudoers'

  met? { path.p.grep(/^#{regex}/) }

  meet do
    buffer = ""
    puts path
    File.readlines(path).each do |line|
      if /^##{regex}/ =~ line
        buffer << "#{line.sub('#')}\r\n"
      else
        buffer << line
      end
    end

    `#{buffer} > /tmp/test`
    puts buffer

  end
end