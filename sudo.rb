dep 'sudoers' do
  regex = "%wheel\sALL=\(ALL\)\sALL"
  path = '/etc/sudoers'.p

  met? { path.grep(/^#{regex}/) }

  meet do
    buffer = ""
    path.readlines do |line|
      if regex =~ /^##{regex}/
        buffer << "#{line.sub('#')}\r\n"
      else
        buffer << line
      end
      puts buffer
    end

  end
end