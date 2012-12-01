dep 'backup cron', :hour, :minute do
  met? { generated_config?("/etc/cron.d/backup") }

  meet do
    render_erb_template "/cron.d/backup.erb", :to => '/etc/cron.d/backup'
  end
end

dep 'backup' do
  met? { shell?("gem list | egrep -q 'backup'") }
  meet { log_shell "Installing backup", "gem install backup" }
end

dep "backup conf", :server, :site_hostname do
  requires "backup"

  dir = '/opt/backup'
  path = "#{dir}/config.rb"

  met? { path.p.exist? && generated_config?(path) }

  meet do
    shell "mkdir -p #{dir}" unless dir.p.exist?
    render_erb_template "/backup/#{server}.erb", :to => path
  end
end
