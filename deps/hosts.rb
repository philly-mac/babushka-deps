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
      shell "cat >> #{path}", :input => "#{ip_address}          #{host_names}\r\n"
    end
  end

end

dep 'hosts configure suitepad network' do
  requires 'hosts add'.with(:host_names => 'db-server-01', :ip_address => '10.0.0.10'),
    'hosts add'.with(:host_names => 'db-server-02',      :ip_address => '10.0.0.11'),
    'hosts add'.with(:host_names => 'app-server-01',     :ip_address => '10.0.0.12'),
    'hosts add'.with(:host_names => 'monitor-server-01', :ip_address => '10.0.0.13'),
    'hosts add'.with(:host_names => 'mail-server-01',    :ip_address => '10.0.0.14'),
    'hosts add'.with(:host_names => 'search-server-01',  :ip_address => '10.0.0.15'),
end
