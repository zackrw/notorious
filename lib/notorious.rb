require "notorious/version"
require "optparse"
require "redcarpet"
require "giant_client"



module Notorious

  def self.build(opts)
    file_name = opts[:file_name]
    stylesheet = opts[:stylesheet]
    output = opts[:output]
    verbose = opts[:verbose]


    # make the html
    html = self.render(file_name, stylesheet)

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

  def self.render(file_name, stylesheet)
    begin
      styles = File.new(stylesheet, 'r').read
    rescue
      raise RuntimeError, "Could not load the stylesheet. Make sure there is a file at #{stylesheet}"
    end

    # read in and convert the markdown file
    begin
      md_file = File.new(file_name, 'r')
    rescue
      raise ArgumentError, "Could not find the file you specified: #{file_name}"
    end

    # convert markdown to HTML
    md_contents = md_file.read
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    body = md.render(md_contents)
    md_file.close

    self.html(styles, body)
  end

  def self.html(styles, body)

<<HEREDOC
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

  def self.parse

    options = {}

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: notorious command file [options]"
      opts.separator ""
      opts.separator "Specific options:"

      opts.on("-o", "--output [file_name]", String,
        "Specify output file name (defaults to input_file_name.html") do |o|
        o = self.ensure_extension(o, "html")
        options[:output] = o
      end

      opts.on("-s", "--stylesheet [file_name]", String,
        "Specify a custom stylesheet") do |s|
        s = self.ensure_extension(s, "css")
        options[:stylesheet] = s
      end

      opts.on("-v", "--verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end

    end
    opts.parse!

    options
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












