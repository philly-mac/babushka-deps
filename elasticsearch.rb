dep 'elasticsearch' do
  elasticsearch_version = '0.19.1'

  met? do
    File.exists?("/etc/init.d/elasticsearch")
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

      log_shell "Getting service script", "curl -L http://github.com/elasticsearch/elasticsearch-servicewrapper/tarball/master | tar -xz"
      shell "mv *servicewrapper*/service /opt/elasticsearch/bin/"
      shell "rm -Rf *servicewrapper*"
      shell "/opt/elasticsearch/bin/service/elasticsearch install"
      shell "ln -s `readlink -f /opt/elasticsearch/bin/service/elasticsearch` /usr/local/bin/rcelasticsearch"
    end
  end
end

