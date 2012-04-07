['philip', 'fabian'].each do |user|

  dep "user #{user}"  do

    met? do
      '/etc/passwd'.p.grep(/^#{user}/)
    end

    meet do
      key = "#{File.dirname(__FILE__)}/public-keys/#{user}.id_rsa.pub"

      shell "useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash #{user}"
      shell "mkdir /home/#{user}/.ssh"
      shell "touch /home/#{user}/.ssh/authorized_keys"
      shell "cat #{key} >> /home/#{user}/.ssh/authorized_keys"
      shell "chmod 700 /home/#{user}/.ssh"
      shell "chmod 600 -Rf /home/#{user}/.ssh/*"
      shell "chown -Rf #{user} /home/#{user}/.ssh/*"
    end
  end

end