dep 'openvpn binary', :template => 'managed' do
  installs 'openvpn'
  provides 'openvpn'
end

dep 'openvpn config' do
  requires 'openvpn binary'

  met? { "/etc/openvpn/server.conf".p.exist? }

  meet do

    log "Installing openvpn"
    log "Deferring to Expect"
    shell "#{Bab.babushka_root}/expect/openvpn.exp"
  end
end

dep 'openvpn' do
  requires 'openvpn binary', 'openvpn config'
end