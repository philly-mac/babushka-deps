dep 'elasticsearch' do
  requires 'java'

  elasticsearch_version = '0.20.5'

  met? { File.exists?("/usr/share/elasticsearch/bin/elasticsearch") }

  meet do
    cd '/tmp' do
      unless File.exists?('elasticsearch.deb')
        log_shell "Downloading elasticsearch #{elasticsearch_version}",
          "wget https://github.com/downloads/elasticsearch/elasticsearch/elasticsearch-#{elasticsearch_version}.deb -O elasticsearch.deb"
      end

      shell "dpkg -i elasticsearch.deb"

    end
  end
end

