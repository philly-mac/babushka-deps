dep 'ntp.managed' do
  provides ['ntpd']
end

dep 'time zone', :zone do
  requires 'ntp.managed'

  path = '/etc/timezone'.p

  met? { path.grep(zone) }

  meet do
    shell "cat > #{path}", :input => zone
  end

  after do
    shell '/etc/init.d/cron stop'
    shell '/etc/init.d/cron start'
    shell '/etc/init.d/ntp restart'
  end

end