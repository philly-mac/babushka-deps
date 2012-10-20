dep "group create", :group, :system do

  met? { '/etc/group'.p.grep(/^#{group}\:/) }

  meet do
    if system.set?
      shell "groupadd --system #{group}"
    else
      shell "groupadd #{group}"
    end
  end

end