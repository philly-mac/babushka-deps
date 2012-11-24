def iptables_inputs
  [
    {:dport => 22},
    {:dport => 80},
    {:dport => 1194, :protocol => 'udp'},
    {:dport => 2812},
    {:dport => 2899},
    {:dport => 8006},
    {:dport => 19999},
  ]
end

dep 'iptables', :template => 'managed'

dep 'iptables config' do
  requires 'iptables'

  met? do
    iptables_inputs.all? { |input| has_iptables_rule?('input', "ACCEPT.+#{input[:dport]}") }
  end

  meet do
    safe_iptables_init

    options = {:protocol => 'tcp' , :action => 'ACCEPT'}

    iptables_inputs.each { |input| add_iptables_rule('input', options.merge(input)) }
    iptables_log_and_drop('INPUT')
    iptables_set_default('INPUT', 'DROP')

    # make server pingable
    # iptables -I INPUT 3 -p icmp --icmp-type 8 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

    shell "sh -c \"iptables-save > /etc/iptables.rules\""
  end

  after do
    log "Now please add these lines to the /et/network/interfaces file under your primary network device"
    log "pre-up iptables-restore < /etc/iptables.rules"
    log "pre-down iptables-save > /etc/iptables.rules"
  end

end
