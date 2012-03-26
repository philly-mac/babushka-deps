dep 'IverCore-2', :template => 'managed' do
  requires 'philly_mac:server_base'

  installs %w[
    openjdk-7-jre
  ]
end
