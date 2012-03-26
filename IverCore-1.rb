dep 'IverCore-1', :template => 'managed' do
  requires 'server_base'

  installs %w[
    radicale
  ]
end
