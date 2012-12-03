dep 'nginx from passenger' do
  requires 'user create'.with(:user => 'www-data', :system => true)

  met? { '/opt/nginx/sbin/nginx'.p.exists? }

  meet do
    cd '/tmp' do
      if "/tmp/rails-nginx-passenger-ubuntu".p.exists?
        shell "rm -rf rails-nginx-passenger-ubuntu"
      end
      shell "git clone git://github.com/jnstq/rails-nginx-passenger-ubuntu.git"
      shell "mv rails-nginx-passenger-ubuntu/nginx/nginx /etc/init.d/nginx"
      shell "chown root:root /etc/init.d/nginx"
    end
  end

  after do
    # Change the line in the nginx script so the run dir points to /opt/nginx/run
    log "For now you have to manually change it so that the run dir points to /opt/nginx/run"
  end

end

dep 'nginx.managed'