dep 'msmtp', :template => 'managed' do
  installs ['msmtp','msmtp-mta']
  provides ['msmtp', 'sendmail']

  before do
    shell "apt-get -y --purge remove sendmail-base sendmail-cf sendmail-doc"
  end

end