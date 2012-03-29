dep 'radicale', :template => 'managed'

dep 'IverCore-1' do
  requires 'server base',
    'radicale'

end
