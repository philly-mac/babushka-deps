dep 'radicale', :tempalte => 'managed'

end

dep 'IverCore-1' do
  requires 'server base',
    'radicale'

end
