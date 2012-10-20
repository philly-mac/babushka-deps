dep 'email forward', :user_dir, :email do
  path = "#{user_dir}/.forward"

  met? { path.p.exist? && path.p.grep(email) }
  meet { shell "echo #{email} > #{path}" }
end
