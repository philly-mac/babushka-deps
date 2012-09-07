dep 'email forward', :user_dir, :email do
  path = "#{user_dir}/.forward"

  met? { path.p.exists? }
  meet { shell "echo #{email} > #{path}" }
end
