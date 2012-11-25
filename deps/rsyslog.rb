dep "rsyslog.managed" do
  provides ['rsyslogd']

  after do
    shell "sed -i -e 's/^\$ModLoad imklog/#\$ModLoad imklog/g' /etc/rsyslog.conf"
    Bab.service_restart('rsyslog')
  end
end