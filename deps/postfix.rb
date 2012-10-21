dep 'postfix.managed' do

  before do
    shell "apt-get --purge remove sendmail-base sendmail-cf sendmail-doc"
  end
end

dep 'postfix server config' do
  requires 'postfix.managed'

end

dep 'postfix client config' do

end