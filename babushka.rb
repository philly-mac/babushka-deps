def babushka_root
  @babushka_root ||= File.dirname(__FILE__)
end

def service_installed?(service)
  path = '/etc/rc.conf'

  File.readlines(path).each do |line|
    puts "reading line #{line}"
    if daemons = /^DAEMONS=\((.*)\)/.match(line)
      puts "matcth #{daemons.captures} #{daemons}"
      daemons = daemons[1]
      puts "matcth #{daemons}"
      return /[!@\(\s]#{service}[\s\)]/.match(daemons)
    end
  end
  return false
end


def mod_service(service, replacement = nil)

  path = "/etc/rc.conf"
  buffer = ""

  File.readlines(path).each do |line|

    if daemons = /^DAEMONS=\((.*)\)/.match(line)
      daemons = daemons[1]
      if (daemon = /([!@\(\s]#{service}[\s\)])/.match(daemons)) && replacement
        daemon = daemon[1]
        daemons = daemons.sub(daemon, replacement)
        line = "DAEMONS=(#{daemons})"
      else
        daemons = (daemons.split(' ') + [service]).join(' ')
        line = "DAEMONS=(#{daemons})"
      end
      buffer << line
    else
      buffer << line
    end
  end
  path.p.write(buffer)

end