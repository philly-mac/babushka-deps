dep 'nginx' do
  requires 'nginx binary', 'user www'

  met? { '/opt/nginx/sbin/nginx'.p.exists? }

  meet do
    shell "rvm 1.9.3@global; passenger-install-nginx-module  --auto --auto-download --prefix=/opt/nginx"
    cd '/tmp' do
      shell "git clone git://github.com/jnstq/rails-nginx-passenger-ubuntu.git"
      shell "mv rails-nginx-passenger-ubuntu/nginx/nginx /etc/init.d/nginx"
      shell "chown root:root /etc/init.d/nginx"
    end

  after do
    # Change the line in the nginx script so the run dir points to /opt/nginx/run
  end

end
