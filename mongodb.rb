dep 'mongodb sources' do
  mongodb_source = "deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen"
  sources_list = '/etc/apt/sources.list'.p

  met? do
    sources_list.grep mongodb_source
  end

  meet do
    shell_log "Adding key for mongodb", "apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10"
    sources_list.append(mongodb_source)
  end
end

dep 'mongodb', :template => 'managed' do
  requires 'mongodb sources'
  installs 'mongodb-10gen'
end