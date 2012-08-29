dep 'jenkins apt sources' do

  met? { "/etc/apt/sources.list".p.grep("pkg.jenkins-ci.org") }

  meet do
    shell "wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -"
    shell "echo \"\" >> /etc/apt/sources.list"
    shell "echo \"# Jenkins\" >> /etc/apt/sources.list"
    shell "echo \"deb http://pkg.jenkins-ci.org/debian binary/\" >> /etc/apt/sources.list"
  end

  after { shell "apt-get update" }
end


dep 'jenkins', :template => 'managed' do
  requires "jenkins apt sources"
end
