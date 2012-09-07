def graylog2_version
  "0.9.6"
end

dep "graylog2 server" do
  requires "java"

  met? { "/opt/graylog2".p.exist? }

  meet do
    cd "/tmp" do
      shell "wget https://github.com/downloads/Graylog2/graylog2-server/graylog2-server-#{graylog2_version}.tar.gz"
      shell "tar -xzf graylog2-server-#{graylog2_version}.tar.gz"
      shell "mv graylog2-server-#{graylog2_version} graylog2-server"
      shell "mv graylog2-server /opt/"
      cd "/opt/graylog2-server" do
        shell "cp graylog2.conf.example /etc/graylog2.conf"
      end
    end

  end
end

dep "graylog2 client" do

  met? { "/var/www/graylog2.ivercore.com".p.exist? }

  cd "/tmp" do
    shell "wget https://github.com/downloads/Graylog2/graylog2-web-interface/graylog2-web-interface-#{graylog2_version}.tar.gz"
    shell "tar -xzf graylog2-web-interface-#{graylog2_version}.tar.gz"
    shell "mv graylog2-web-interface-#{graylog2_version} graylog2.ivercore.com"
    shell "mv graylog2.ivercore.com /var/www/"
  end

end
