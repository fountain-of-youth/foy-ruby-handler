# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foy_ruby_handler'

Gem::Specification.new do |gem|
  gem.name          = "foy_ruby_handler"
  gem.version       = Foy::RubyHandler::VERSION
  gem.authors       = ["Roberto Soares"]
  gem.email         = ["roberto.tech@gmail.com"]
  gem.summary       = %q{Gemfile/gemspec handler used by foy-worker}
  gem.description   = %q{Gemfile/gemspec handler used by foy-worker}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('bundler', '>= 1.3.1')

  gem.add_development_dependency('rake', '>= 10.0.3')
  gem.add_development_dependency('rspec', '>= 2.13.0')
end
