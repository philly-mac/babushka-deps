dep 'postfix.managed' do
  before do
    shell "apt-get -y --purge remove sendmail-base sendmail-cf sendmail-doc; apt-get install -y mailutils; DEBIAN_FRONTEND='noninteractive' apt-get install -y --reinstall postfix"
  end
end