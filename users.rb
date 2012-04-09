def all_users
  ['philip', 'fabian']
end

all_users.each do |user|

  dep "user #{user}" do

    met? do
      '/etc/passwd'.p.grep(/^#{user}/)
    end

    meet do
      key = "#{File.dirname(__FILE__)}/public-keys/#{user}.id_rsa.pub"

      shell "useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash #{user}"
      shell "echo \"#{user}:password\"|chpasswd"
      shell "mkdir /home/#{user}/.ssh"
      shell "touch /home/#{user}/.ssh/authorized_keys"
      shell "cat #{key} >> /home/#{user}/.ssh/authorized_keys"
    end

    after do
      shell "chmod 700 /home/#{user}/.ssh"
      shell "chmod 600 -Rf /home/#{user}/.ssh/*"
      shell "chown -Rf #{user}:users /home/#{user}/.ssh"
    end
  end

end

dep 'user www' do
  met? do
    '/etc/passwd'.p.grep(/^www/)
  end

  meet do
    # key = "#{File.dirname(__FILE__)}/public-keys/#{user}.id_rsa.pub"
    shell "useradd -g www --system www"
  end
end