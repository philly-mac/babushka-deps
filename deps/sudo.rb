dep 'sudoers' do
  regex = "%admin\\sALL=\\(ALL\\)\\sNOPASSWD:\\sALL"
  path = '/etc/sudoers'

  met? { path.p.grep(/^#{regex}/) }

  meet do
    buffer = ""
    File.readlines(path).each do |line|
      if /^(#.*)#{regex}/ =~ line
        buffer << "#{line.sub($1, '')}"
      else
        buffer << line
      end
    end

    path.p.write(buffer)
  end
end