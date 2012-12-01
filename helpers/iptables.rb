class Iptables

  extend Babushka::ShellHelpers

  def self.has_rule?(chain, matcher, table = 'filter')
    shell?("iptables -t #{table} -n -v -L #{chain.upcase} | egrep -q '#{matcher}'")
  end

  def self.add_rule(chain, options)
    if (chain = check_chain(chain)).nil?
      log "No or invalid chain specified: #{chain}"
      return
    end

    unless [:action, :type].all?{|option| options.has_key?(option)}
      log "No or invalid action/type specified: action => #{options[:action]}, type => #{options[:type]}"
      return
    end

    unless check_action(options[:action].upcase)
      log "No or invalid action specified: #{action}"
      return
    end

    cmd = ['iptables']

    cmd << case options[:type]
    when :append then "-A #{chain}"
    when :insert then
      if option[:position]
        "-I #{chain} #{options[:position]}"
      else
        return
      end
    else
      return
    end

    cmd << "-p #{options[:protocol]}"            if options[:protocol]

    cmd << "-i #{options[:in_interface]}"        if options[:in_interface]
    cmd << "-o #{options[:out_interface]}"       if options[:out_interface]

    cmd << "-s #{options[:source]}"              if options[:source]
    cmd << "-d #{options[:destination]}"         if options[:destination]
    cmd << "-m #{options[:match]}"               if options[:match]

    cmd << "--state #{options[:state]}"          if options[:state]
    cmd << "--icmp-type #{options[:icmp_type]}"  if options[:icmp_type]

    cmd << "--dport #{options[:dport]}"          if options[:dport]
    cmd << "--sport #{options[:sport]}"          if options[:sport]

    cmd << "-j #{options[:action]}"


    cmd = cmd.join(' ')
    log_shell("Applying #{cmd}", cmd)
  end

  def self.log_and_drop(chain)
    chain = chain.upcase
    shell "iptables -A #{chain} -m limit --limit 5/min -j LOG --log-prefix \"iptables denied: \" --log-level 7"
    shell "iptables -A #{chain} -j DROP"
  end

  def self.set_default(chain, action)
    chain  = check_chain(chain)
    action = check_action(action)

    return if [chain, action].any?(&:nil?)

    shell "iptables -P #{chain} #{action}"
  end

  def self.check_chain(chain)
    chain = chain.to_s.upcase
    return nil unless %w{INPUT OUTPUT FORWARD}.include?(chain)
    chain
  end

  def self.check_action(action)
    action = action.to_s.upcase
    return nil unless %w{ACCEPT DROP FORWARD}.include?(action)
    action
  end

  def self.add_raw_rule(rule)
    shell("iptables #{rule}")
  end

  def self.remove_rule(chain, options)

  end

  def self.safe_init
    clear
    shell "iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT"
    shell "iptables -A INPUT -i lo -j ACCEPT"
  end

  def self.clear
    shell "iptables -P INPUT ACCEPT"
    shell "iptables -P OUTPUT ACCEPT"
    shell "iptables -P FORWARD ACCEPT"

    shell "iptables -F"
    shell "iptables -X"

    shell "iptables -P OUTPUT ACCEPT"
    shell "iptables -P FORWARD ACCEPT"
    shell "iptables -P INPUT ACCEPT"
  end
end
