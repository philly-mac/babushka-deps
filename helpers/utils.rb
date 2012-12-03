def replace_line(filename, line, replacement)
  shell "sed -i'' -e 's/^#{Regexp.escape(line)}$/#{replacement}/' '#{filename}'"
end

def render_erb_template(file_path, options = {})
  file_path "/#{file_path}" unless file_path.strip =~ /^\//
  file_path << '.erb'       unless file_path.strip =~ /\.erb$/
  render_erb("#{babushka_root}/templates/#{file_path}", options)
end

def babushka_root
  unless File.exist?('/tmp/babushka_root')
    puts "No /tmp/babushka_root set"
    exit(1)
  end

  def set_babushka_root
  @babushka_root ||= "#{File.dirname(__FILE__)}/.."
end

def generated_config?(path)
  path.p.grep(/Generated by babushka/)
end

def service_restart(service)
  shell "/etc/init.d/#{service} restart"
end