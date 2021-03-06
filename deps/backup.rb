dep 'backup cron' do

  path = "/etc/cron.d/backup"

  met? { generated_config?(path) }

  meet do
    render_erb_template "/cron.d/backup.erb", :to => path
    shell "chmod 600 #{path}"
  end
end

dep "backup conf" do

  dir = '/opt/backups/bin'
  path = "#{dir}/backup"

  met? { path.p.exist? && generated_config?(path) }

  meet do
    shell "mkdir -p #{dir}" unless dir.p.exist?
    render_erb_template "/backup/backup.erb", :to => path
    shell "chmod 755 #{path}"
  end
end
