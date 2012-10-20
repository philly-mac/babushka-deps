def has_iptables_rule?(chain, matcher)
  shel?("iptables -n -v -L #{chain.upcase} | egrep -q '#{matcher}'")
end

def add_iptables_rule(chain, options)
  return if (chain = iptables_check_chain).nil?
  return unless [:action, :type].all?{|option| options.has_key?(option)}
  return unless iptables_check_action(options[:action].upcase)

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

  cmd << "-p #{options[:protocol]}"       if options[:protocol]

  cmd << "-i #{options[:in_interface]}"   if options[:in_interface]
  cmd << "-o #{options[:out_interface]}"  if options[:out_interface]

  cmd << "-s #{options[:source]}"         if options[:source]
  cmd << "-d #{options[:destination]}"    if options[:destination]

  cmd << "-dport #{options[:dport]}"      if options[:dport]
  cmd << "-sport #{options[:sport]}"      if options[:sport]

  cmd << "-j #{options[:action]}"


  cmd = cmd.join(' ')
  log_shell(cmd, cmd)
end

def iptables_log_and_drop(chain)
  chain = chain.upcase
  shell "iptables -A #{chain} -m limit --limit 5/min -j LOG --log-prefix \"iptables denied: \" --log-level 7"
  shell "iptables -A #{chain} -j DROP"
end

def iptables_set_default(chain, action)
  chain  = iptables_check_chain(chain)
  action = iptables_check_action(action)

  return if [chain, action].any?(&:nil?)

  shell "iptables -P #{chain} #{action}"
end

def iptables_check_chain(chain)
  chain = chain.to_s.upcase
  return nil unless %w{INPUT OUTPUT FORWARD}.include?(chain)
  chain
end

def iptables_check_action(action)
  action = action.to_s.upcase
  return nil unless %w{ACCEPT DROP FORWARD}.include?(action)
  action
end

def add_iptables_raw_rule(rule)
  shell("iptables #{rule}")
end

def remove_iptables_rule(chain, options)

end

def safe_iptables_init
  shell "iptables -P INPUT ACCEPT"
  shell "iptables -P OUTPUT ACCEPT"
  shell "iptables -P FORWARD ACCEPT"

  shell "iptables -F"
  shell "iptables -X"

  shell "iptables -P OUTPUT ACCEPT"
  shell "iptables -P FORWARD ACCEPT"

  shell "iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT"
  shell "iptables -A INPUT -i lo -j ACCEPT"
end

def iptables_clear
  shell "iptables -P INPUT ACCEPT"
  shell "iptables -P OUTPUT ACCEPT"
  shell "iptables -P FORWARD ACCEPT"

  shell "iptables -F"
  shell "iptables -X"

  shell "iptables -P OUTPUT ACCEPT"
  shell "iptables -P FORWARD ACCEPT"
  shell "iptables -P INPUT ACCEPT"
end