dep 'tmux.managed'

dep 'tmux conf', :user do
  requires 'tmux.managed'

  path = "#{user_home(user)}/.tmux.conf"

  met? { path.p.exist? }

  meet do
    render_erb_template "/tmux/tmux.conf.erb", :to => path
  end
end