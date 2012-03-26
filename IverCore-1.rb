dep 'IverCore-1', :template => 'managed' do
  requires 'philly-mac:server_base'

  installs %w[
    radicale
  ]
end
