dep 'proxmox host' do
  requires 'server base',
    'iptables config'.with(:input_accept_list => [2901, 2902, 2903, 2904, 2905, 8006, 19999, 2812, 22, 2899, 80, 8080, 9418], :output_accept_list => [9418]),
    'iptables restore',
end
