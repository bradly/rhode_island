# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rhode_island/version'

Gem::Specification.new do |gem|
  gem.name          = "rhode_island"
  gem.version       = RhodeIsland::VERSION
  gem.authors       = ["Bradly Feeley"]
  gem.email         = ["bradlyf@gmail.com"]
  gem.description   = %q{A really small state machince for Ruby on Rails}
  gem.summary       = %q{A really small state machince for Ruby on Rails}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rails"
  gem.add_development_dependency "rspec-rails"
  gem.add_development_dependency "sqlite3"
end
