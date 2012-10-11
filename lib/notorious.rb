require "notorious/version"
require 'redcarpet'



module Notorious

  def self.render(file_name)

    stylesheet = 'default.css'
    styles = File.new(File.expand_path(File.join(File.dirname(__FILE__), "../stylesheets/#{stylesheet}"))).read

    md_file = File.new(file_name, 'r').read
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    body = md.render(md_file)

    html = <<HEREDOC
<!DOCTYPE html>
<html>
<head>
  <style type='text/css'>
    #{styles}
  </style>
  <title>Tech Notes</title>
</head>
<body>
  #{body}
</body>
</html>
HEREDOC

  end

end
