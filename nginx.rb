dep 'nginx auto start' do
  met? { service_installed?('nginx') }
  meet { mod_service('nginx') }
end

dep 'nginx rc.d' do
  met? { babushka_config?('/etc/rc.d/nginx') }
  meet do
    render_erb 'rc.d/nginx.erb', :to => '/etc/rc.d/nginx'
  end
  after do
    shell 'chmod 700 /etc/rc.d/nginx'
    shell 'rc.d restart nginx'
  end
end

dep 'nginx' do
  requires 'nginx auto start', 'nginx rc.d'

  met? { '/opt/nginx/sbin/nginx'.p.exists? }

  meet { shell "rbfu @1.9.3 passenger-install-nginx-module  --auto --auto-download --prefix=/opt/nginx"}

end