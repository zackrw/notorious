# -*- encoding: utf-8 -*-
require File.expand_path('../lib/notorious/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zack Reneau-Wedeen"]
  gem.email         = ["z.reneau.wedeen@gmail.com"]
  gem.description   = %q{Notorious allows you to take notes in pure Markdown and review them in your browser.}
  gem.summary       = %q{Notorious, the Markdown note taker}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = ["notorious"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "notorious"
  gem.require_paths = ["lib"]
  gem.version       = Notorious::VERSION

  gem.add_dependency("redcarpet", "~> 2.1.0")

  gem.add_development_dependency 'rspec'
end
