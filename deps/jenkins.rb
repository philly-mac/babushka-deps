dep 'jenkins apt sources' do

  met? { shell?("egrep -q 'pkg.jenkins-ci.org' /etc/apt/sources.list") }

  meet do
    shell "wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -"
    shell "echo \"\" >> /etc/apt/sources.list"
    shell "echo \"# Jenkins\" >> /etc/apt/sources.list"
    shell "echo \"deb http://pkg.jenkins-ci.org/debian binary/\" >> /etc/apt/sources.list"
  end

  after { shell "apt-get update" }
end


dep 'jenkins.managed' do
  requires "jenkins apt sources"

  met? { '/usr/share/jenkins/jenkins.war'.p.exist? }
end
