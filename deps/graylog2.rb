def graylog2_version
  "0.9.6"
end

def graylog2_client_name
  "graylog2-web-interface-#{graylog2_version}"
end

def graylog2_server_name
  "graylog2-server-#{graylog2_version}"
end

dep "graylog2 server" do
  requires "java", 'graylog2 server init script'

  path = "/opt/graylog2-server"

  met? { path.p.exist? }

  meet do
    cd "/tmp" do
      shell "wget https://github.com/downloads/Graylog2/graylog2-server/#{graylog2_server_name}.tar.gz"
      shell "tar -xzf #{graylog2_server_name}.tar.gz"
      shell "mv #{graylog2_server_name} graylog2-server"

      unless "/opt/graylog2-server".p.exist?
        shell "mv graylog2-server /opt/"
      end

      cd "/opt/graylog2-server" do
        shell "cp graylog2.conf.example /etc/graylog2.conf"
      end
    end

  end

  after do
    shell "chmod 755 #{path}/graylog2-server.jar"
    shell "chmod 755 /etc/init.d/graylog2-server"
    shell "update-rc.d graylog2-server defaults"
  end

end

dep 'graylog2 server init script' do
  path = '/etc/init.d/graylog2-server'.p

  met? { path.exist? }
  meet { render_erb_template "/init.d/graylog2-server.erb", :to => path }

end

dep "graylog2 client", :site_hostname do

  met? { "/var/www/graylog2.#{site_hostname}".p.exist? }

  meet do
    cd "/tmp" do
      shell "wget https://github.com/downloads/Graylog2/graylog2-web-interface/#{graylog2_client_name}.tar.gz"
      shell "tar -xzf #{graylog2_client_name}.tar.gz"
      shell "mv #{graylog2_client_name} graylog2.#{site_hostname}"
      shell "mv graylog2.#{site_hostname} /var/www/"
    end
  end

end

dep 'graylog2 syslog-ng config' do

  requires 'syslog-ng.managed'

  path = '/etc/syslog-ng/conf.d/graylog2.conf'.p

  met? { path.exist? }
  meet { render_erb_template "/syslog-ng/graylog2.conf.erb", :to => path }
  after { shell 'service syslog-ng restart'}

end
