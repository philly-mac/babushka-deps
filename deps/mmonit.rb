dep 'mmonit' do
  path = "/opt/mmonit".p

  met? { p.exist? }

  meet do
    cd "/tmp" do
      shell "wget http://mmonit.com/dist/mmonit-2.4-linux-x64.tar.gz"
      shell "tar -xzf mmonit-2.4-linux-x64.tar.gz"
      shell "mv mmonit-2.4 /opt/mmonit"
      render_erb_template "/init.d/mmonit.erb", :to => '/etc/init.d/mmonit'
    end
  end

  after do
    shell "chmod 755 /etc/init.d/mmonit"
    shell "update-rc.d mmonit defaults"
    shell "/etc/init.d/mmonit start"
  end

end