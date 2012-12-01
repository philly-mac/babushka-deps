dep 'postfix.managed' do
  before do
    shell "apt-get -y --purge remove sendmail-base sendmail-cf sendmail-doc; apt-get install -y mailutils; apt-get install -y --reinstall postfix"
  end
end