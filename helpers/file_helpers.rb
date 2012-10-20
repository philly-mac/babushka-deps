def replace_line(filename, line, replacement)
  shell "sed -i'' -e 's/^#{Regexp.escape(line)}$/#{replacement}/' '#{filename}'"
end

def render_erb_template(file_path, options = {})
  file_path "/#{file_path}" unless file_path.strip =~ /^\//
  file_path << '.erb'       unless file_path.strip =~ /\.erb$/
  render_erb("#{babushka_root}/templates/#{file_path}", options)
end