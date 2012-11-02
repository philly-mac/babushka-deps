dep 'postfix.managed' do

  before do
    shell "apt-get -y --purge remove sendmail-base sendmail-cf sendmail-doc; apt-get install -y mailutils; apt-get install --reinstall postfix"
  end



end

dep 'postfix server config' do
  requires 'postfix.managed'

end

dep 'postfix client config' do

end