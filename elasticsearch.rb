dep 'elasticsearch auto start' do
  path    = "/etc/rc.local".p
  content = "/usr/local/bin/elasticsearch start"

  met? { path.grep(content) }
  meet { path.append("\n#{content}") }
end

dep 'elasticsearch binary' do
  met? { babushka_config?('/usr/local/bin/elasticsearch') }
  meet do
    render_erb 'bin/elasticsearch.erb', :to => '/usr/local/bin/elasticsearch'
  end
end

dep 'elasticsearch' do
  requires 'elasticsearch auto start', 'elasticsearch binary'

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

