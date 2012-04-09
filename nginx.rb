dep 'nginx auto start' do
  path    = "/etc/rc.local".p
  content = "/usr/local/bin/nginx start"

  met? { path.grep(content) }
  meet { path.append("\n#{content}") }
end

dep 'nginx binary' do
  met? { babushka_config?('/usr/local/bin/nginx') }
  meet do
    render_erb 'bin/nginx.erb', :to => '/usr/local/bin/nginx'
  end
end

dep 'nginx' do
  requires 'nginx auto start', 'nginx binary', 'user www'

  met? { '/opt/nginx/sbin/nginx'.p.exists? }

  meet { shell "rbfu @1.9.3 passenger-install-nginx-module  --auto --auto-download --prefix=/opt/nginx"}

  after do
    shell "mkdir /opt/nginx/run"
    shell "mkdir /opt/nginx/logs"
  end

end