sudo apt-get --purge remove sendmail-base sendmail-cf sendmail-doc

dep 'postfix', :template => 'managed'

dep 'postfix server config' do
  requires 'postfix'
end

dep 'postfix client config' do

end