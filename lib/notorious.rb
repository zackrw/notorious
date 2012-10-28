require "notorious/version"
require "redcarpet"



module Notorious

  def self.build(opts)
    file_names = opts[:file_names]
    stylesheet = opts[:stylesheet]
    title = opts[:title]
    output = opts[:output]
    verbose = opts[:verbose]


    # make the html
    html = self.render(file_names, title, stylesheet)

    # write to the output file
    outfile = File.new(File.expand_path(output), 'w')
    outfile.write(html)
    outfile.close

    if verbose
      puts "your notes are at #{output}. Attempting to open them with a web browser"
    end

    # try to open them
    begin
      `open #{output}`
    rescue
      puts "your notes are at #{output}. Please open them with a web browser"
    end
  end

  def self.render(file_names, title, stylesheet)
    begin
      styles = File.new(stylesheet, 'r').read
    rescue
      raise RuntimeError, "Could not load the stylesheet. Make sure there is a file at #{stylesheet}"
    end

    body = ""

    file_names.each do |f|
      # read in and convert the markdown file
      begin
        md_file = File.new(f, 'r')
      rescue
        raise ArgumentError, "Could not find the file you specified: #{f}"
      end

      # convert markdown to HTML
      md_contents = md_file.read
      md = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      body += md.render(md_contents)
      md_file.close
    end

    self.html(styles, title, body)
  end

  def self.html(styles, title, body)

<<HEREDOC
<!DOCTYPE html>
<html>
<head>
  <style type='text/css'>
    #{styles}
  </style>
  <title>#{title}</title>
</head>
<body>
  #{body}
</body>
</html>
HEREDOC

  end

  def self.ensure_extension(file, ext)
    split = file.split('.')
    unless split.length > 1 && split[-1] == ext
      file = "#{file}.#{ext}"
    end
    file
  end

  def self.validate_extension(file, ext)
    split = file.split('.')
    unless split.length > 1 && ext.include?(split[-1])
      raise ArgumentError, "Input must have extension in #{ext}"
    end
  end

end












