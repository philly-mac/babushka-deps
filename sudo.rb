dep 'sudoers' do
  regex = "%wheel\\sALL=\\(ALL\\)\\sALL"
  path = '/etc/sudoers'

  met? { puts "CHECKING MET #{path.p.grep(/^#{regex}/)}";path.p.grep(/^#{regex}/) }

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