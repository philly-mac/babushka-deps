dep 'iptables', :template => 'managed'

dep 'iptables config', :input_accept_list, :output_accept_list do
  requires 'iptables'

  met? do
    input_accept_list.all? do |port|
      shell?("iptables -L | egrep 'ACCEPT.+#{port}$'")
    end
  end

  meet do
    shell "iptables -P INPUT ACCEPT"
    shell "iptables -P OUTPUT ACCEPT"
    shell "iptables -P FORWARD ACCEPT"

    shell "iptables -F"
    shell "iptables -X"

    shell "iptables -P OUTPUT ACCEPT"
    shell "iptables -P FORWARD ACCEPT"

    shell "iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT"
    shell "iptables -A INPUT -i lo -j ACCEPT"

    input_accept_list.each do |port|
      shell "iptables -A INPUT -p tcp --dport #{port} -j ACCEPT"
    end

    shell "iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix \"iptables denied: \" --log-level 7"
    shell "iptables -A INPUT -j DROP"

    output_accept_list.each do |port|
      shell "iptables -A OUTPUT -p tcp --dport #{port} -j ACCEPT"
    end

    shell "rc.d save iptables"
    shell "iptables -P INPUT DROP"
    shell "rc.d save iptables"
  end

end
