dep 'hosts add', :host_names, :ip_address do
  path = '/etc/hosts'.p

  met? do
    path.exist? && path.grep(/^#{Regexp.escape(ip_address)}.+#{Regexp.escape(host_names)}/)
  end

  meet do
    if path.grep(/^#{Regexp.escape(ip_address)}/)
      file_lines = '/etc/hosts'.p.readlines.map do |line|
        line = "#{ip_address}          #{host_names}" if /^#{Regexp.escape(ip_address)}/ =~ line
        line
      end.join('')

      shell "cat > #{path}", :input => file_lines
    else
      shell "cat >> #{path}", :input => "#{ip_address}          #{host_names}\n"
    end
  end

end
