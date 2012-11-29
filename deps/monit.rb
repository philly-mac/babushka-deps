dep 'monit.managed'

dep "monit conf startup" do
  path = "/etc/defaults/monit".p

  met? { !path.exist? || (path.exist? && path.grep('startup=1')) }
  meet { shell("sed -i'' -e 's/^startup=0$/startup=1/' '#{path}'") }
end

dep "monit conf", :email do
  requires "monit.managed", "monit conf startup"

  met? { generated_config?("/etc/monit/monitrc") }
  meet { render_erb_template "/monit/monit.erb", :to => "/etc/monit/monitrc" }
end

dep "monit conf app", :app_name, :group_email_address do
  requires "monit conf".with(:email => group_email_address)

  path = "/etc/monit/conf.d/#{app_name}"

  met? { generated_config?(path) }
  meet { render_erb_template "/monit/#{app_name}.erb", :to => path }
end