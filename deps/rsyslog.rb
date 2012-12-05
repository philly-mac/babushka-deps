dep "rsyslog.managed" do
  provides ['rsyslogd']

  after do
    service_restart('rsyslog')
  end
end
