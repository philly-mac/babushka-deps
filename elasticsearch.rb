dep 'elasticsearch auto start' do
  met? { service_installed?('elasticsearch') }
  meet { mod_service('elasticsearch') }
end

dep 'elasticsearch rc.d' do
  met? { babushka_config?('/etc/rc.d/elasticsearch') }
  meet do
    render_erb 'rc.d/elasticsearch.erb', :to => '/etc/rc.d/elasticsearch'
  end
  after { shell 'rc.d restart elasticsearch' }
end

dep 'elasticsearch' do
  requires 'elasticsearch auto start', 'elasticsearch rc.d'

  elasticsearch_version = '0.19.1'

  met? do
    File.exists?("/opt/elasticsearch")
  end

  meet do
    cd '/tmp' do
      unless File.exists?('/opt/elasticsearch')
        unless File.exists?('elasticsearch.tar.gz')
          log_shell "Downloading elasticsearch #{elasticsearch_version}",
            "wget https://github.com/downloads/elasticsearch/elasticsearch/elasticsearch-#{elasticsearch_version}.tar.gz -O elasticsearch.tar.gz"
          shell "tar -xf elasticsearch.tar.gz"
          shell "mv elasticsearch-* elasticsearch"
          shell "mv elasticsearch /opt/"
        end
      end
    end
  end
end

