dep 'backup cron' do
  met? { babushka_config?('/etc/cron.d/backup') }
  meet do
    render_erb 'cron.d/backup.erb', :to => '/etc/cron.d/backup'
  end
end

dep 's3cmd' do

  met? do
    File.exists?("/opt/s3cmd")
  end

  meet do
    cd '/opt' do
      log_shell "Downloading s3cmd", "git clone https://github.com/s3tools/s3cmd.git"
    end
  end
end

dep 'backup' do
  requires 'rsync', 'ruby', 's3cmd', 'backup cron'

  met? do
    File.exists?("/opt/backup")
  end

  meet do
    cd '/opt' do
      log_shell "Downloading backup", "git clone git://github.com/philly-mac/backup.git"
    end
  end
end