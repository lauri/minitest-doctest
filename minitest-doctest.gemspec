# encoding: utf-8
$: << File.expand_path("../lib", __FILE__)
require "minitest/doctest/version"

Gem::Specification.new do |gem|
  gem.name          = "minitest-doctest"
  gem.version       = Minitest::Doctest::VERSION
  gem.email         = ["git@lap.fi"]
  gem.authors       = gem.email
  gem.description   = "Generate tests from code comments"
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/lauri/minitest-doctest"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "minitest", "> 5.1"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "appraisal"
end
