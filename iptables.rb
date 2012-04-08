dep 'iptables', :template => 'managed'

dep 'iptables auto start' do
  met? { service_installed?('iptables') }
  meet { mod_service('iptables') }
end

dep 'iptables config' do
  requires 'iptables', 'iptables auto start'

  # met? do
  #   shell("iptables -L | grep 'dport\\ 2899'"){|s| s.ok? }
  # end

  # meet do
  #   shell "iptables -F"
  #   shell "iptables -X"
  #   shell "iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT"
  #   shell "iptables -A INPUT -i lo -j ACCEPT"
  #   shell "iptables -A INPUT -p tcp --dport 19999 -j ACCEPT"
  #   shell "iptables -A INPUT -p tcp --dport 2812 -j ACCEPT"
  #   shell "iptables -A INPUT -p tcp --dport 22 -j ACCEPT"
  #   shell "iptables -A INPUT -p tcp --dport 2899 -j ACCEPT"
  #   shell "iptables -A INPUT -p tcp --dport 80 -j ACCEPT"
  #   shell "iptables -A INPUT -p tcp --dport 9418 -j ACCEPT"
  #   shell "iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix \"iptables denied: \" --log-level 7"
  #   shell "iptables -A INPUT -j DROP"
  #   shell "iptables -A OUTPUT -p tcp --dport 9418 -j ACCEPT"
  #   shell "rc.d save iptables"
  #   shell "iptables -P OUTPUT DROP"
  #   shell "iptables -P FORWARD DROP"
  #   shell "rc.d save iptables"
  #   shell "iptables -P INPUT DROP"
  # end

end