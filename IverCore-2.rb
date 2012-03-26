dep 'IverCore-2', :template => 'managed' do
  requires 'server_base'

  installs %w[
    openjdk-7-jre
  ]
end
