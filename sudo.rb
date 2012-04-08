dep 'sudoers' do
  regex = "%wheel\\sALL=\\(ALL\\)\\sALL"
  path = '/etc/sudoers'

  met? { path.p.grep(/^#{regex}/) }

  meet do
    buffer = ""
    File.readlines(path).each do |line|
      if /^(#.*)#{regex}/ =~ line
        buffer << "#{line.sub($1, '')}\n"
      else
        buffer << line
      end
    end

    File.new(path, 'w').write(buffer)
  end
end