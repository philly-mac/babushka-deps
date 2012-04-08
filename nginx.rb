dep 'nginx' do
  met? { '/opt/nginx/sbin/nginx'.p.exists? }

  meet { shell "rbfu @1.9.3 passenger-install-nginx-module  --auto --auto-download --prefix=/opt/nginx"}

end