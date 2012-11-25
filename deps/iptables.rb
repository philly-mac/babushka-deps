dep 'iptables.managed'

dep 'iptables config', :config do
  requires 'iptables.managed'

  met? do
    config.to_a.all? do |input|
      Iptables.has_rule?('input', "ACCEPT.+#{input[:dport]}")
    end
  end

  meet do
    Iptables.safe_init

    options = {:protocol => 'tcp' , :action => 'ACCEPT'}

    config.to_a.each { |input| Iptables.add_rule('input', options.merge(input)) }

    Iptables.log_and_drop('INPUT')
    Iptables.set_default('INPUT', 'DROP')

    if config.to_a.all? { |input| Iptables.has_rule?('input', "ACCEPT.+#{input[:dport]}") }
      shell "sh -c \"iptables-save > /etc/iptables.rules\""
    else
      Iptables.clear
      log "Not all rules were applied. Rules have been cleared"
    end

  end

  after do
    log "Now please add these lines to the /et/network/interfaces file under your primary network device"
    log "pre-up iptables-restore < /etc/iptables.rules"
    log "pre-down iptables-save > /etc/iptables.rules"
  end

end
