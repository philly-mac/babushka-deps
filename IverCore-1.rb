dep 'IverCore-1', :template => 'managed' do
  requires 'philly_mac:server_base'

  installs %w[
    radicale
  ]
end
